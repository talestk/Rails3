class ProjectsController < ApplicationController

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
    #passing the params[:id] which gives a singleProject object that relates to a record in the database
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end
end
