Feature: Simple Example
	#In order to use the internet, As a user I want to search for sites

Background:
  Given I am on the Google web page

Scenario: google search
   When I search for "Edgewords"
   Then "Edgewords" appears in the results

Scenario Outline: multiple search
   When I search for "<search_term>"
   Then "<search_term>" appears in the results
 Examples: 
|search_term|
| Edgewords |
|  Ranorex  |

Scenario: table values search
   When I search for "Edgewords"
   Then I see in the results
	|search_term|          url          |
	| Edgewords |edgewordstraining.co.uk|
	| Edgewords |      linkedin.com     |
 
