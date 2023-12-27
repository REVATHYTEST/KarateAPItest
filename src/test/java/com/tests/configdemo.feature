Feature: config demo

  Background: 
    * url baseURL

  Scenario: config demo 1
    Given print name

  Scenario: Get API Request
    Given path "users?page=2"
    When method GET
    Then status 200
