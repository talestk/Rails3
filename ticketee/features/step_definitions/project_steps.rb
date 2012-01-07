Given /^there is a project called "([^\"]*)"$/ do |name|
  Factory(:project, :name => name)
end

Given /^I follow "([^\"]*)"$/ do |name|
  click_on(name)
end

Then /^I should be on the project page for "([^\"]*)"$/ do |name|
  current_path.should == project_path(Project.find_by_name!(name))
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |arg1, name|
  fill_in('Name', :with => name )
end

When /^I press "([^\"]*)"$/ do |link|
  click_on(link)
end

Then /^I should see "([^\"]*)"$/ do |message|
  page.should have_content(message)
end