class SkillsController < ApplicationController
	def index
		@tweets = Tweet.includes(:user).order("created_at DESC")
		
		render "index"
  end
end
