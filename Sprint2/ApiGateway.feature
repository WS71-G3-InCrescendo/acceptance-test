Feature: API Gateway

  Scenario: Route a request to User Service
    Given the API Gateway is running
    When I send a GET request to "/api/users/1" through the gateway
    Then the request should be routed to the User Service
    And the response status should be 200

  Scenario: Route a request to Product Service
    Given the API Gateway is running
    When I send a GET request to "/api/products/10" through the gateway
    Then the request should be routed to the Product Service
    And the response status should be 200

  Scenario: Route a request to Order Service
    Given the API Gateway is running
    When I send a GET request to "/api/orders/5" through the gateway
    Then the request should be routed to the Order Service
    And the response status should be 200