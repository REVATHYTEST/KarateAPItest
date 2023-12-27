Feature: Perform Curd operations

  Background: 
    * url 'https://api.escuelajs.co/api/v1/products'

  Scenario: Create a get request
    When method get
    Then status 200
    # printing the get request
    And print "response is:" , response
    Then assert responseTime < 4000

  Scenario: Get a single product
    Given path "/19"
    When method get
    Then status 200
    And print "response is:" , response
    Then assert responseTime < 4000

  Scenario: Create a product using PUT Request
    And request {"title": "New Product Added","price": 15,"description": "A description added","categoryId": 1,"images": ["https://placeimg.com/640/480/any"]}
    When method POST
    Then status 201
    And print "response is:", response

  Scenario: Edit the record using PUT Request
    When method get
    Then status 200
    # printing the get request
    And print "response is:" , response
    And def postId = response.id
    And path "/18"
    And request {"title": "Title changed","price": 150}
    When method PUT
    Then status 200
    And print "response is:", response
    
    Scenario: Delete the updated record using Delete Request
    Given path "/18"
    And request {"title": "Title changed","price": 150}
    When method PUT
    Then status 200
    And print "response is:", response
    And def postId = response.id
    And path postId
    When method DELETE
    Then status 200
    And print "response is:", response
    
    