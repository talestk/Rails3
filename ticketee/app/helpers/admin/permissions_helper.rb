module Admin::PermissionsHelper
  # define the permissions method, which contains a list of permissions to display check
  # boxes on this page. Because this method is specific to views from 
  # the Admin ::PermissionsController

  def permissions
    {
      "view" => "View",
      "create tickets" => "Create Tickets",
      "edit tickets" => "Edit Tickets",
      "delete tickets" => "Delete Tickets"
    }
    
  end
end
