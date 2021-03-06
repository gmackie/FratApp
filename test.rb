class GroupController < ApplicationController
  def new
    @group = Group.new
    if @group.save
      flash[:success] = "Group Created!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def create
    @group = Group.new(group_params)
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

    def group_params
      params.require(:group).permit(:name)
    end

end
