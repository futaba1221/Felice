class NicesController < ApplicationController
    
 def create
    @nice = Nice.new(
            user_id: current_user.id,
            post_id: params[:post_id])
    @nice.save
    redirect_to ("/posts/#{params[:post_id]}")
 end
  
 def destroy
    @nice = Nice.find_by(
            user_id: current_user.id,
            post_id: params[:post_id])
    @nice.destroy
    redirect_to ("/posts/#{params[:post_id]}")
 end
 
  private
 def nice_params
  params.require(:nice).permit(:user_id, :post_id).merge(id: current_user.id)
 end
    
end
