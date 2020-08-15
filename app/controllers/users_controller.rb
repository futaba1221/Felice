class UsersController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    
    if @user.gender == "m"
     @users= User.where(gender: "f").all.order(updated_at: :desc)
    else
     @users= User.where(gender: "m").all.order(updated_at: :desc)
    end

  end
  
  def show
    @user = User.find_by(id: params[:id])
    @relationships = Relationship.where(follower_id: @user).all
  end
  
  def diarys
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user).all.order(updated_at: :desc)
  end
  
  def nices
    @user = User.find_by(id: params[:id])
    @nices = Nice.where(user_id: @user)
  end
  
  def like
    @user = User.find(params[:id])
    @relationships = Relationship.where(follower_id: @user).all
  end
  
  def relike
    @user = User.find(params[:id])
    @relationships = Relationship.where(followed_id: @user).all
  end
  
end
