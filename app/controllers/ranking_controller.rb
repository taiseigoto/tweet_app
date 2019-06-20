# class RankingController < ApplicationController
# 	layout 'right_bar'
#     before_action :ranking
#     def ranking
#       likes_ids = Tweet.group(:likes_count).order('count_likes_count DESC').limit(5).count(:likes_count).keys
#       @ranking = likes_ids.map { |id| Like.find(user_id) }
#     end
# end
