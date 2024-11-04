Feature: Order Controller API

  Scenario: Create a new order
    Given I have the following order data
      | productId | quantity |
      | 10        | 2        |
    When I send a POST request to "/api/orders"
    Then the response status should be 201
    And the response should contain the order ID and details

  Scenario: Get order details
    Given an existing order with ID "5"
    When I send a GET request to "/api/orders/5"
    Then the response status should be 200
    And the response should contain order details including product ID and quantity

  Scenario: Update order quantity
    Given an existing order with ID "5"
    And I have the updated order quantity
      | quantity |
      | 3        |
    When I send a PUT request to "/api/orders/5"
    Then the response status should be 200
    And the order quantity should be updated

  Scenario: Delete an order
    Given an existing order with ID "5"
    When I send a DELETE request to "/api/orders/5"
    Then the response status should be 204
    And the order should no longer be retrievable
