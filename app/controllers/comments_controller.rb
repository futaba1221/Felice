class CommentsController < ApplicationController
    
 before_action :authenticate_user!, {only: [:new, :edit, :create, :update, :destroy]}
    
 def create
   @post = Post.find_by(id: params[:post_id])
   @post.comments.create(comment_params)
   redirect_to post_path(@post)
 end
 
 def destroy
   @post = Post.find_by(id: params[:post_id])
   @comment = @post.comments.find_by(id: params[:id])
   @comment.destroy
   redirect_to post_path(@post)
 end
 
  private
   def comment_params
     params.require(:comment).permit(:body).merge(user_id: current_user.id)
   end
    
end
