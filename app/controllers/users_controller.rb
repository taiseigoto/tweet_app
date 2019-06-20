class UsersController < ApplicationController
	def show
		# user = User.find(params[:id])
		# @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
		@users = User.find(params[:id])
		@tweets = @users.tweets.order("created_at DESC")
		# @showuser = User.find_by(id: params[:id])
	end

	
end
