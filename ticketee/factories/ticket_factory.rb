Factory.define :ticket do |ticket|
  # setting up some defaults for the title and description fields for a factory-provided ticket
  ticket.title "A ticket"
  ticket.description "A ticket, nothing more"
  
  # passing a block and calling association method on the obj returned from the block
  # the user for this ticket becomes one user factory-created. So as the projects.
  ticket.user { |u| u.association(:user) }
  ticket.project { |p| p.association(:project) }
end
  