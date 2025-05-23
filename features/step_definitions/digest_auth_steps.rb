require_relative '../support/page_objects/digest_auth_page'
require 'rspec/expectations'

Given(/^I navigate to the digest auth page with valid credentials$/) do
  @driver.get('http://admin:admin@the-internet.herokuapp.com/digest_auth')
end

Then(/^I should see a digest auth success message$/) do
  expect(@driver.page_source).to include('Digest Auth')
end

Given(/^I navigate to the digest auth page with invalid credentials$/) do
  @driver.get('http://wrong:wrong@the-internet.herokuapp.com/digest_auth')
end

Then(/^I should see an unauthorized error$/) do
  expect(@driver.page_source).to match(/<html><head><\/head><body><\/body><\/html>|<h1>401 Unauthorized<\/h1>/)
end
