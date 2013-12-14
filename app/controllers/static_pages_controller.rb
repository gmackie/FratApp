class StaticPagesController < ApplicationController

  def home
    if signed_in?
      if Group.all.size < 1
        flash[:error] = "Error: no groups created, please create one!"
        redirect_to newgroup_path
      else
        @junk = Micropost.all
        @microposts = @junk.paginate(page: params[:page])
        @comment = Comment.new
        @group = Group.all.first
        @micropost  = current_user.microposts.build
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
