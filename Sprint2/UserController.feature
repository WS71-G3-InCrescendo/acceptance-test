Feature: User Controller API

  Scenario: Create a new user
    Given I have the following user data
      | username | email           | password |
      | user123  | user@example.com | 12345    |
    When I send a POST request to "/api/users"
    Then the response status should be 201
    And the response should contain the user ID and username

  Scenario: Get user details
    Given an existing user with ID "1"
    When I send a GET request to "/api/users/1"
    Then the response status should be 200
    And the response should contain the username and email

  Scenario: Update user information
    Given an existing user with ID "1"
    And I have the new data for the user
      | email           | password |
      | newemail@example.com | newpassword |
    When I send a PUT request to "/api/users/1"
    Then the response status should be 200
    And the user information should be updated

  Scenario: Delete a user
    Given an existing user with ID "1"
    When I send a DELETE request to "/api/users/1"
    Then the response status should be 204
    And the user should no longer be retrievable