class StaticPagesController < ApplicationController
  before_filter :authenticate_user!
  def home
      @junk = Micropost.all
      @microposts = @junk.paginate(page: params[:page])
      @comment = Comment.new
      @group = Group.all.first
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
