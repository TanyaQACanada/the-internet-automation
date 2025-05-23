require_relative '../support/page_objects/secure_area_page'
require 'rspec/expectations'

Then('I should be on the secure area page') do
  @secure_area = SecureAreaPage.new(@driver)
  @wait.until { @driver.current_url.include?(SecureAreaPage::URL_FRAGMENT) }
  expect(@secure_area.current_url).to include(SecureAreaPage::URL_FRAGMENT)
end

Then('I should see the logout button') do
  @secure_area = SecureAreaPage.new(@driver) unless @secure_area
  @wait.until { @secure_area.logout_button.displayed? }
  expect(@secure_area.logout_button.displayed?).to be true
end

When('I click the logout button') do
  @secure_area = SecureAreaPage.new(@driver) unless @secure_area
  @wait.until { @secure_area.logout_button.displayed? }
  @secure_area.click_logout
end

Then('I should be back on the login page') do
  @wait.until { @driver.current_url.end_with?(LoginPage::URL) }
  expect(@driver.current_url).to end_with(LoginPage::URL)
end
