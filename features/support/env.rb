require 'selenium-webdriver'
require 'cucumber'
require 'rspec/expectations'
require 'webdrivers'
require 'page-object'

Dir[File.join(File.dirname(__FILE__), 'page_objects', '*.rb')].each { |f| require f }

Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-infobars')
  options.add_argument('--start-maximized')
  
  # Set Chrome binary path based on environment
  if ENV['CI']
    # CI environment (Ubuntu)
    options.binary = '/usr/bin/google-chrome'
  else
    # Local environment (MacOS)
    options.binary = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
  end
  
  @driver = Selenium::WebDriver.for :chrome, options: options
  @driver.manage.timeouts.implicit_wait = 20
  @wait = Selenium::WebDriver::Wait.new(timeout: 20)
end

After do
  @driver.quit if @driver
end
