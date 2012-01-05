module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      root_path
    when /the project page for "([^\"]*)"/
      project_path(Project.find_by_name!($1))
    when /the new client page/
      new_client_path
    when /the clients page/
      clients_path    
    # Add more page name => path mappings here
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
      "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World(NavigationHelpers)