Feature: Product Controller API

  Scenario: Create a new product
    Given I have the following product data
      | name    | price | stock |
      | ProductA | 50    | 100   |
    When I send a POST request to "/api/products"
    Then the response status should be 201
    And the response should contain the product ID and name

  Scenario: Get product details
    Given an existing product with ID "10"
    When I send a GET request to "/api/products/10"
    Then the response status should be 200
    And the response should contain the name, price, and stock

  Scenario: Update product information
    Given an existing product with ID "10"
    And I have the updated product data
      | price | stock |
      | 60    | 150   |
    When I send a PUT request to "/api/products/10"
    Then the response status should be 200
    And the product details should be updated

  Scenario: Delete a product
    Given an existing product with ID "10"
    When I send a DELETE request to "/api/products/10"
    Then the response status should be 204
    And the product should no longer be retrievable
