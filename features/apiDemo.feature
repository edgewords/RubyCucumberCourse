Feature: API Demos

Scenario: Customer Lookup
    When I request API information on employee "1"
    Then The Customer Name is "ajay devgan rohit shetty"