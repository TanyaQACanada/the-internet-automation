require_relative '../support/page_objects/login_page'

Given(/^I am on the login page$/) do
  @driver.get('http://the-internet.herokuapp.com/login')
end

When(/^I log in with valid credentials$/) do
  @driver.find_element(id: 'username').send_keys('tomsmith')
  @driver.find_element(id: 'password').send_keys('SuperSecretPassword!')
  @driver.find_element(css: 'button[type="submit"]').click
end

Then(/^I should see a login success message$/) do
  expect(@driver.find_element(css: '.flash.success').text).to include('You logged into a secure area!')
end

When(/^I log in with invalid credentials$/) do
  @driver.find_element(id: 'username').send_keys('wrong')
  @driver.find_element(id: 'password').send_keys('wrong')
  @driver.find_element(css: 'button[type="submit"]').click
end

Then(/^I should see an error message$/) do
  expect(@driver.find_element(css: '.flash.error').text).to include('Your username is invalid!')
end
