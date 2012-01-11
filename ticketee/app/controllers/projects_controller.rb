class ProjectsController < ApplicationController

  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :authenticate_user!, :only =>[:show]
  
  # before filter are run before all the actions in the controller unless you specify (:only,:exept)
  # find_project method sets up the @ project variable for you so no need for the:
  # @project = Project.find(params[:id]) in these methods anymore.
  before_filter :find_project, :only => [:show,:edit,:update,:destroy]

  def index
    # by calling all on the Project model we retriece all the records from the db as Project objects
    # and they are available as an Array-like object ( therefore passing the test and defining the
    # variable to the index.html.erb )
    @projects = Project.all
  end
  
  def new
    # Project constant is going to be a class located at models (thereby making it a model)
    @project = Project.new 
  end
  
  def create
    # hashWithIndifferenceAccess ( can reference a String key by using a matching symbol and vice-versa)    
    @project = Project.new(params[:project]) #to access the name field use params[:project][:name]

    if @project.save # saves the new object into projects table
      
      flash[:notice] = "Project has been created."
      #redirect_to method takes either a path or object to redirect to as a String (project_path(@project))
      redirect_to @project
    else
      flash[:alert] = "Project has not been created." 
      render :action =>"new"
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    # update_attributes takes a hash of attributes identical to the ones passed to new or create, udates
    # those specified attributes on the object, and then saves them to the databse if they are valid
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else 
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy 
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end
  
  private
    def find_project
      #passing the params[:id] which gives a singleProject object that relates to a record in the database
      # the readable_by method returns a scope of only the projects the user is allowed to view
      @project = if current_user.admin?
          Project.find(params[:id])
        else
          Project.readable_by(current_user).find(params[:id])
        end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to projects_path
    end
end
