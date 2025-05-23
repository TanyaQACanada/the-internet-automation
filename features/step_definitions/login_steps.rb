require_relative '../support/page_objects/login_page'

Given('I am on the login page') do
  @login_page = LoginPage.new(@driver)
  @login_page.visit
end

When('I log in with valid credentials') do
  @login_page.login_as('tomsmith', 'SuperSecretPassword!')
end

Then('I should see a success message') do
  expect(@login_page.flash_message).to match(/You logged into a secure area!/)
end

When('I log in with invalid credentials') do
  @login_page.login_as('wronguser', 'wrongpass')
end

Then('I should see an error message') do
  expect(@login_page.flash_message).to match(/Your username is invalid!/)
end
