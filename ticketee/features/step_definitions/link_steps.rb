# these two steps use the have_css method provided by Capybara, 
# which checks that a page fas an element matching a Cascading Style Sheets (CSS)

Then /^I should not see the "([^\"]*)" link$/ do |text|
  page.should_not(have_css("a", :text => text), "Expected to not see the #{text.inspect} link, but did.")
end

Then /^I should see the "([^\"]*)" link$/ do |text|
  page.should(have_css("a", :text => text), "Expected to see the #{text.inspect} link, but did not.")
end