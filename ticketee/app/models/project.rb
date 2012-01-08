class Project < ActiveRecord::Base
  has_many :tickets
  validates :name, :presence => true # Validations
end
