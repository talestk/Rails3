Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = Factory(:project, :name => name)
end

Given /^I follow "([^\"]*)"$/ do |name|
  click_on(name)
end

Then /^I should be on the project page for "([^\"]*)"$/ do |name|
  current_path.should == project_path(Project.find_by_name!(name))
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |arg1, arg2|
  fill_in(arg1, :with => arg2 )
end

When /^I press "([^\"]*)"$/ do |link|
  click_button(link)
end

Then /^I should see "([^\"]*)"$/ do |message|
  page.should have_content(message)
end

When /^I check "([^\"]*)"$/ do |button|
  check(button)
end

#For this step definition, you must first find the project by its name so you can get its ID, because a later part of this step that checks the permission check box requires the ID of the project to compile the ID for the fields. Then you use the handy steps method you used in chapter 7 to call another step where you pass in the downcase’d and gsub’d version of the permission string. The name passed in is the titleize’d version of the permission and should match the title in the permissions table heading.
 
When /^I check "([^"]*)" for "([^"]*)"$/ do |permission, name|
  project = Project.find_by_name!(name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  steps(%Q{When I check "#{field_id}"})
end