class DigestAuthPage
    SUCCESS_URL = 'https://admin:admin@the-internet.herokuapp.com/digest_auth'
    FAILURE_URL = 'https://wrong:wrong@the-internet.herokuapp.com/digest_auth'
  
    def initialize(driver)
      @driver = driver
    end
  
    def visit_with_valid_credentials
      @driver.navigate.to(SUCCESS_URL)
    end
  
    def visit_with_invalid_credentials
      @driver.navigate.to(FAILURE_URL)
    end
  
    def message_text
      @driver.find_element(tag_name: 'h3').text
    end
  end
  