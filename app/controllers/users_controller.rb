class UsersController < ApplicationController
  
  # include ApplicationHelper
  
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
    @relationships = Relationship.where(follower_id: @user.id)
    @footprint = Footprint.new
    @footprints = Footprint.where(visited_id: current_user.id)
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.delete
    flash[:notice] = "過去情報は削除しました。新規登録して下さい。"
    redirect_to new_user_registration_path
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
  
  def relike # 自分にいいねした相手一覧
    # new_like_to_me.count
    @unconfirm_relations = Relationship.where(followed_id: current_user.id, status: false)
    @confirm_relations = Relationship.where(followed_id: current_user.id, status: true)
  end
  
  def hide
    @user = User.find_by(id: current_user.id)
    
    @user.update(status: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用お待ちしております。"
    redirect_to root_path
  end
  
  def reregistration #再登録画面
    @user = User.find_by(id: params[:id])
  end
  
  def restoration #userの復元
    @user = User.find_by(id: params[:id])
    @user.update(status: false)
    flash[:notice] = "過去情報を復元しました。ログインしてください。"
    redirect_to new_user_session_path
  end
  
  
end
