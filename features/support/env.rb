require 'selenium-webdriver'
require 'cucumber'
require 'rspec/expectations'
require 'webdrivers'
require 'page-object'

Dir[File.join(File.dirname(__FILE__), 'page_objects', '*.rb')].each { |f| require f }

Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-infobars')
  options.add_argument('--start-maximized')
  
  options.binary = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
  
  @driver = Selenium::WebDriver.for :chrome, options: options
  @driver.manage.timeouts.implicit_wait = 10
end

After do
  @driver.quit if @driver
end
