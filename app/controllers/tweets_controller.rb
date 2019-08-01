class TweetsController < ApplicationController

  def index
    @tweets = Tweet.per_page_kaminari(params[:page]).per(5).includes(:user).order("created_at DESC")
    @tweet = Tweet.new
    @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').limit(10).pluck(:tweet_id))

    if user_signed_in?
      @users = User.where.not(id: current_user.id).order("created_at DESC")
      @user = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(id: current_user.id)
        respond_to do |format|
          format.html
          format.json
      end
    end
  end

  def create
    Tweet.create(tweet_params)
    redirect_to :root
  end


  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user.id == current_user.id
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  def show
    @tweets = Tweet.find(params[:id])
  end

  def search
  end

private
  def tweet_params
    params.require(:tweet).permit(:text,:image).merge(user_id: current_user.id)
  end
end
