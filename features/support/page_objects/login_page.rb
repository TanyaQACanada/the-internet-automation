class LoginPage
    URL = 'https://the-internet.herokuapp.com/login'
  
    def initialize(driver)
      @driver = driver
    end
  
    def visit
      @driver.navigate.to(URL)
    end
  
    def username_field
      @driver.find_element(id: 'username')
    end
  
    def password_field
      @driver.find_element(id: 'password')
    end
  
    def login_button
      @driver.find_element(css: 'button.radius')
    end
  
    def flash_message
      @driver.find_element(id: 'flash').text
    end
  
    def login_as(user, pass)
      visit
      username_field.send_keys(user)
      password_field.send_keys(pass)
      login_button.click
    end
  end
  