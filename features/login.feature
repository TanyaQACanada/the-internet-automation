Feature: Authentication

  Scenario: Successful login
    Given I am on the login page
    When I log in with valid credentials
    Then I should see a login success message

  Scenario: Failed login
    Given I am on the login page
    When I log in with invalid credentials
    Then I should see an error message
