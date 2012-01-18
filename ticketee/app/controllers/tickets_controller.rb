class TicketsController < ApplicationController
  # if it fails the others before_filters will not run (save CPU cycles)
  before_filter :authenticate_user! #, :except => [:index, :show]
  before_filter :find_project
  before_filter :find_ticket, :only => [:show,:edit,:update,:destroy]
  before_filter :authorize_create!, :only => [:new, :create]
    
  def new
    @ticket = @project.tickets.build
  end
  
  def create
    # the merge! method is a Hash and HashWithIndifferentAccess method 
    #wich merges the provide keys and overrides any keys already specified.
    @ticket = @project.tickets.build(params[:ticket].merge!(:user => current_user))
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      # specify an Array containing a project obj and a ticket obj (project_ticket_path(@project,@ticket))
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end
  
  def show
    
  end
  
  def edit
    # empty because the find_ticket before filter does all the hard lifting
  end
  
  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
      
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @ticket.destroy 
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
    
  end
  
  def authorize_create!
    if !current_user.admin? && cannot?("create tickets".to_sym, @project)
      flash[:alert] = "You cannot create tickets on this project."
      redirect_to @project
    end
    
  end

  private
   
    def find_project
      @project = Project.for(current_user).find(params[:project_id])
      # it will retrieve a Project only if the current_user has permission to view
      # that project or an admin, otherwise an ActiveRecord exception will be thrown and rescued 
      # here showing the users a message.
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to root_path
    end
    
    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    end
end
