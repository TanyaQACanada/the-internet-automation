Feature: Secure Area

  Background:
    Given I am on the login page
    And I log in with valid credentials

  Scenario: I see the secure area page
    Then I should be on the secure area page
    And I should see the logout button

  Scenario: I can log out from secure area
    When I click the logout button
    Then I should be back on the login page
