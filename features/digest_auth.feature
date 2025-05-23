Feature: Digest Authentication

  Scenario: Access with valid credentials
    Given I navigate to the digest auth page with valid credentials
    Then I should see a digest auth success message

  Scenario: Access with invalid credentials
    Given I navigate to the digest auth page with invalid credentials
    Then I should see an unauthorized error
