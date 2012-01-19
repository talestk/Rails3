class Admin::PermissionsController < Admin::BaseController
  before_filter :find_user
  
  def index
    # this Ability instance lets us check the user's ability to perform specific actions
    # by simply calling this code: @ability.can?(:"view", @project)
    @ability = Ability.new(@user)
    @projects = Project.all
  end
  
  def update
    #first clear all the users’ permissions using the association method clear. Next, you iterate through all the key-value pairs in params[:permissions] and find the project for each one. Then you iterate through the permissions for the parameter and create a new permission for every project. Finally, you set a flash[:notice] and redirect back to the permissions page.
    
    @user.permissions.clear
    params[:permissions].each do |id, permissions|
      project = Project.find(id)
      permissions.each do |permission, checked|
        Permission.create!(:user => @user,
                           :thing => project,
                           :action=> permission)
      end
    end
    
    flash[:notice] = "Permissions updated."
    redirect_to admin_user_permissions_path
  end
  
  private
  
  def find_user
    @user = User.find(params[:user_id])
  end
end
