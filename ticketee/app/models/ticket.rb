class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user # belongs_to method defines methods for accessing the association (like has_many)
  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => { :minimum => 10 }
                          
end
