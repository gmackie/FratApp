class GroupsController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: [:edit, :update, :destroy]

  def index
    @groups = Group.paginate(page: params[:page])
  end

  def show
    @group = Group.find(params[:id])
    @microposts = @group.microposts.paginate(page: params[:page])
    @comment = Comment.new
  end
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)
    if @group.save
      flash[:success] = "Group Created!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group destroyed."
    redirect_to groups_url
  end

  private

    def groups_params
      params.require(:group).permit(:name)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
