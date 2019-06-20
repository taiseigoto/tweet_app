class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
	def show
		# user = User.find(params[:id])
		# @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
		@users = User.find(params[:id])
		@tweets = @users.tweets.order("created_at DESC")
		# @showuser = User.find_by(id: params[:id])
	end

	def destroy 
    @user = User.find_by(id: params[:id])
    @tweets = Tweet.find_by(user_id: params[:id])

    if @tweets.nil?
      @user.destroy
      redirect_to :root
    else
      @tweets.destroy
      @user.destroy
      redirect_to :root
    end 
end

	
end
