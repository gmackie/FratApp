class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @junk = Micropost.all
      @microposts = @junk.paginate(page: params[:page])
      @comment = Comment.new
      @groups = Group.all
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
