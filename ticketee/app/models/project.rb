class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :nullify # UPDATE tickets SET project_id = NULL 
                                            # WHERE project_id = :project_id
  # for large amount of tickets and DONT have callbacks use this:
  # :destroy_all # SQL - DELETE FROM tickets WHERE project_id = :project_id
  validates :name, :presence => true # Validations
end
