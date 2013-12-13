class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = comment.new(params[:comment])
    @comment.micropost = @micropost
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment created"
      render 'static_pages/home'
    else
      redirect_to root_url
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_url
  end
end
