class SecureAreaPage
    URL_FRAGMENT = '/secure'
  
    def initialize(driver)
      @driver = driver
    end
  
    def current_url
      @driver.current_url
    end
  
    def logout_button
      @driver.find_element(css: 'a.button.secondary.radius')
    end
  
    def click_logout
      logout_button.click
    end
  end
  