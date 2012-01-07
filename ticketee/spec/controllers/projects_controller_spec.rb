require 'spec_helper'

describe ProjectsController do
  it "displays an error for a missing project" do
    get :show, :id => "not-here" # GET request to the show action for the ProjectsController
    response.should redirect_to(projects_path) # response should take us to project_path (redirect_to)
    message = "The project you were looking for could not be found."
    flash[:alert].should eql(message)
  end
end
