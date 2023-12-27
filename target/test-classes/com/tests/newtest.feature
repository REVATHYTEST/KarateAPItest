Feature: New API Testing

  Background: 
    * url "https://reqres.in/api"
    * def expectedOutcome = read("response.json")

  Scenario: Get API Request
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200

  #normal post request
  Scenario: POST Request 1
    Given url "https://reqres.in/api/users"
    And request {"name": "Revathy C", "job": "Software Tester"}
    When method POST
    Then status 201
    And print "response is:", response

  # using background
  Scenario: POST Request 2
    Given path "/users"
    And request {"name": "Revathy", "job": " Tester"}
    When method POST
    Then status 201
    And print "response is:", response

  #Assertion
  Scenario: POST Request 3
    Given path "/users"
    And request {"name": "Revathy", "job": " Tester"}
    When method POST
    Then status 201
    And print "response is:", response
    And match response == {"name":"Revathy","job":" Tester","id":"#notnull","createdAt":"#ignore"}
    And assert responseTime < 2000

  #Read the response from file
  Scenario: POST Request 4
    Given path "/users"
    And request {"name": "Revathy", "job": " Tester"}
    When method POST
    Then status 201
    And print "response is:", response
    And match response == expectedOutcome
    And match $ == expectedOutcome

  #Read the request from file
  Scenario: POST Request 5
    Given path "/users"
    And def requestBody = read("request.json")
    And request requestBody
    When method POST
    Then status 201
    And print "response is:", response
    And match response == {"name": "REVATHY","job": "SOFTWARE TESTER", "id":"#notnull","createdAt":"#ignore"}

  #Changing the value in request body
  Scenario: Post Request 6

  Scenario: POST Request 5
    Given path "/users"
    And def requestBody = read("request.json")
    And set requestBody.job = "Test Analyst"
    And request requestBody
    When method POST
    Then status 201
    And print "response is:", response
    And match response == {"name": "REVATHY","job": "Test Analyst", "id":"#notnull","createdAt":"#ignore"}
