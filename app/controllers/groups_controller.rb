class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: [:edit, :update, :destroy]

  def index
    @groups = Group.paginate(page: params[:page])
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @microposts = @group.microposts.paginate(page: params[:page])
    if @users.include? current_user
      @micropost = current_user.microposts.build

    end
    @comment = Comment.new
  end
  
  def new
    @group = Group.new
    @group.users.build
  end

  def create
    @group = Group.new(groups_params)
    @group.users<< current_user
    if @group.save
      flash[:success] = "Group Created!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def addUser
    @group = Group.find(params[:id])
    @group.users<<User.find(params[:user_id])
    if @group.update_attributes(add_user_params)
      flash[:success] = "User Added to group"
      redirect_to @group
    else
      redirect_to root_path
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
    
    def add_user_params
      params.permit(:id, :name, :users)
    end

    def groups_params
      params.require(:group).permit(:name)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
