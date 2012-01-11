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
