class PostsController < ApplicationController
    
  def index
      
    if current_user.gender == "f"
        @users = User.where(gender: "m").order(updated_at: :desc)
        @posts = Post.where(user_id: @users)
    elsif current_user.gender == "m"
        @users = User.where(gender: "f").order(updated_at: :desc)
        @posts = Post.where(user_id: @users)
    else
        flash[:notice] = "存在しない性別です"
        redirect_to root_path
    end
    
  end
    
  def show
   @post = Post.find_by(id: params[:id])
   @user = User.find_by(id: @post.user_id)
   @nices_count = Nice.where(post_id: @post.id).count
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params)
   
    if @post.save
     flash[:notice] = "投稿されました"
     redirect_to posts_path
    else
     flash[:notice] = "投稿できませんでした"
     render "new"
    end
  end
 
  def edit
    @post = Post.find_by(id: params[:id])
  end
 
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
     redirect_to posts_path
    else
     render "edit"
    end
  end
 
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path
  end
 
  private
   def post_params
    params.require(:post).permit(:title, :article, images: []).merge(user_id: current_user.id)
   end
 
end
