Dir[Rails.root + "factories/*.rb"].each do |file|
  # loading the files for the factories
  require file
end