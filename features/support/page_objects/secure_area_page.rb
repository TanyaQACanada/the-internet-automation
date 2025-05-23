class SecureAreaPage
    URL_FRAGMENT = '/secure'
    LOGOUT_BUTTON_CSS = 'a.button.secondary.radius'
  
    def initialize(driver)
      @driver = driver
      @wait = Selenium::WebDriver::Wait.new(timeout: 10)
      wait_for_page_load
    end
  
    def current_url
      @driver.current_url
    end
  
    def logout_button
      @driver.find_element(css: LOGOUT_BUTTON_CSS)
    end
  
    def click_logout
      logout_button.click
    end
  
    private
  
    def wait_for_page_load
      @wait.until { current_url.include?(URL_FRAGMENT) }
    rescue Selenium::WebDriver::Error::TimeoutError
      raise "Failed to load secure area page. Current URL: #{current_url}"
    end
  end
  