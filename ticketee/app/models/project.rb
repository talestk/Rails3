class Project < ActiveRecord::Base
  
  has_many :tickets, :dependent => :nullify # UPDATE tickets SET project_id = NULL 
                                            # WHERE project_id = :project_id
  # for large amount of tickets and DONT have callbacks use this:
  # :destroy_all # SQL - DELETE FROM tickets WHERE project_id = :project_id
  validates :name, :presence => true # Validations
  
  has_many :permissions, :as => :thing
  
  # usually the scope passin a block (lambda).
  # in this case the scope is dynamic according to which user is passed to it
  #the joins method uses a SQL INNER JOIN
  scope :readable_by, lambda { |user| 
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })}
end
