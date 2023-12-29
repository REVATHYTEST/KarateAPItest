Feature: Query & Path Parameter

  Scenario: Query parameter
    Given url "https://reqres.in/api/users"
    And param page = '2'
    When method GET
    Then status 200
    Given url "https://reqres.in/api/users"
    And path '2'
    When method get
    Then status 200
    And print "response is:", response
