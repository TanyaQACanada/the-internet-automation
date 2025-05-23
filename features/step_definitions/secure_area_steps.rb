require_relative '../support/page_objects/secure_area_page'
require 'rspec/expectations'

Then('I should be on the secure area page') do
  @secure_area = SecureAreaPage.new(@driver)
  expect(@secure_area.current_url).to include(SecureAreaPage::URL_FRAGMENT)
end

Then('I should see the logout button') do
  expect(@secure_area.logout_button.displayed?).to be true
end

When('I click the logout button') do
  @secure_area.click_logout
end

Then('I should be back on the login page') do
  expect(@driver.current_url).to end_with(LoginPage::URL)
end
