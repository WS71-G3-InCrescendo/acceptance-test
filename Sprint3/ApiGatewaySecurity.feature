Feature: API Gateway Security
  As a user
  I want secure access to the API Gateway
  So that only authorized users can access the microservices

  Background:
    Given the API Gateway is running

  Scenario: Unauthorized access attempt
    When an unauthenticated user sends a request to the gateway
    Then the response should have status code 401
    And the response should contain a message "Unauthorized access"

  Scenario: Authorized access with valid token
    Given a valid access token
    When an authenticated user sends a request with the token to the gateway
    Then the response should have status code 200
    And the response should allow access to the requested service

  Scenario: Expired token handling
    Given an expired access token
    When an authenticated user sends a request with the expired token to the gateway
    Then the response should have status code 401
    And the response should contain a message "Token expired"
