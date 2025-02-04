class RelationshipsController < ApplicationController
    
      before_action :authenticate_user!

  def index
    @following = current_user.following
    @follower = current_user.followers
    @friends = @following & @follower
  end

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end



end
