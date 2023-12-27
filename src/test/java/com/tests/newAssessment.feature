Feature: Perform Curd operations

  Background: 
    * url 'https://api.escuelajs.co/api/v1/products'

  Scenario: Create a get request
    When method GET
    Then status 200
    # printing the get request
    And print "response is:" , response
    Then assert responseTime < 4000

  Scenario: Create a product using PUT Request
    And request {"title": "New Product Added","price": 15,"description": "A description added","categoryId": 1,"images": ["https://placeimg.com/640/480/any"]}
    When method POST
    Then status 201
    And print "response is:", response
    Then match response $ == {"title": "New Product Added","price": 15,"description": "A description added","images": ["https://placeimg.com/640/480/any"],"category": {"id": 1,"name": "#notnull","image": "#ignore","creationAt": "#ignore","updatedAt": "#ignore"},"id": "#notnull","creationAt": "#ignore","updatedAt": "#ignore"}
    Then assert responseStatus == 201 || responseStatus == 200
    And match responseType == 'json'

  Scenario: Edit the record using PUT Request
    When method get
    Then status 200
    # printing the get request
    And print "response is:" , response
    And def postId = response.id
    And path "/184"
    And request {"title": "Title changed","price": 150}
    When method PUT
    Then status 200
    And print "response is:", response

  Scenario: Delete the updated record using Delete Request
    Given path "/184"
    When method DELETE
    Then status 200
    And print "response is:", response

  Scenario: pagination
    Given url "https://api.escuelajs.co/api/v1/products?offset=0&limit=10"
    When method GET
    Then status 200
    And print "response is:", response
