class Project < ActiveRecord::Base
  validates :name, :presence => true # Validations
end
