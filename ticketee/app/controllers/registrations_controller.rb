# By defining this new controller you inherit all the behavior from 
# that controller and gain the ability to override things
class RegistrationsController < Devise::RegistrationsController

  private
  
  # the resource argument is the User object representing who's signing up 
  def after_inactive_sign_up_path_for(resource)
    confirm_user_path
  end
end