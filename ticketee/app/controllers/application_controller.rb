class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  # this method users the authenticate_user! provided by Devise
  # to ensure that the user is signed in
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end
