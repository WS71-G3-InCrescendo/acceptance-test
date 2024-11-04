Feature: API Gateway Routes
  As a user
  I want to access specific routes through the API Gateway
  So that my requests are correctly routed to the appropriate microservices

  Background:
    Given the API Gateway is configured with routes to the user, product, and order services

  Scenario: Access User Service through API Gateway
    When a request is sent to the "/api/users" endpoint on the gateway
    Then the response should have status code 200
    And the response should be routed to the User Service

  Scenario: Access Product Service through API Gateway
    When a request is sent to the "/api/products" endpoint on the gateway
    Then the response should have status code 200
    And the response should be routed to the Product Service

  Scenario: Access Order Service through API Gateway
    When a request is sent to the "/api/orders" endpoint on the gateway
    Then the response should have status code 200
    And the response should be routed to the Order Service

  Scenario: Invalid route on API Gateway
    When a request is sent to an unknown route "/api/unknown" on the gateway
    Then the response should have status code 404
    And the response should contain a message "Route not found"
