class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.new(comment_params)
    @comment.micropost = @micropost
    @comment.user = current_user
    if @comment.save
      @micropost.touch
      flash[:success] = "Comment created"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_url
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user
    @junk = Comment.all
    @comment =  @junk.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

end
