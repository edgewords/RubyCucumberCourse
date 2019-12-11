Feature: CustomerAccountGet
Test the customer account GET method

Background: 
Given I have created and posted a valid Customer Account action request

Scenario: Customer Account get with readonly access
Given I have Readonly Access
When I do a CustomerAccount GET by customerAccountId
Then I should get a 200 response code
And the customerAccountId should match

Scenario: Customer Account get with no claims
Given I have No Claims
When I do a CustomerAccount GET by customerAccountId
Then I should get a 403 response code

Scenario: Customer Account get with no authentication
Given I do not have access
When I do a CustomerAccount GET by customerAccountId
Then I should get a 401 response code

Scenario: Customer Account get with an unparsable value
Given I have Admin Access
When I do a customerAccount GET with an unparsable value
Then I should get a 404 response code