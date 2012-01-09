Factory.define :user do |user|
  # sequence method provided by, Factory Girl which passes a unique number to the block 
  # and makes the user's email addresses unique
  user.sequence(:email) { |n| "user#{n}@ticketee.com" }
  user.password "password"
  user.password_confirmation "password"
end