require 'spec_helper'

describe ProjectsController do
  # multi-line this method defines a user method, which returns a newly created and confirmed user
  let(:user) { create_user! }  
  
  let(:project) { Factory(:project) }
  
  context "standard users" do
    {"new" => "get",
      "create" => "post",
      "edit"=> "get",
      "update" => "put",
      "destroy" => "delete"}.each do |action, method|
      
        it "cannot access the new #{action} action" do
          sign_in(:user, user)
          send(method, action.dup, :id => project.id)
          response.should redirect_to(root_path)
          flash[:alert].should eql("You must be an admin to do that.")
        end
        
        it "cannot access the show action" do
          sign_in(:user, user)
          get :show, :id => project.id
          response.should redirect_to(projects_path)
          flash[:alert].should eql("The project you were looking for could not be found.")
        end
    end
  end
  it "displays an error for a missing project" do
    sign_in(:user, user)
    get :show, :id => "not-here" # GET request to the show action for the ProjectsController
    response.should redirect_to(projects_path) # response should take us to project_path (redirect_to)
    message = "The project you were looking for could not be found."
    flash[:alert].should eql(message)
  end
end
