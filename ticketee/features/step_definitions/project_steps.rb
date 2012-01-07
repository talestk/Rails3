Given /^there is a project called "([^\"]*)"$/ do |name|
  Factory(:project, :name => name)
end

Given /^I follow "([^\"]*)"$/ do |name|
  click_on(name)
end

Then /^I should be on the project page for "([^\"]*)"$/ do |name|
  current_path.should == project_path(Project.find_by_name!(name))
end