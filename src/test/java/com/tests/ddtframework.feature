Feature: Perform Curd operations

  Background: 
    * url 'https://api.escuelajs.co/api/v1/products'



  Scenario: Create a product using PUT Request
    And request {"title": "#(title)","price":"#(price)" ,"description": "#(description added)","categoryId": "#(categoryId)","images": ["#(images)"]}
    When method POST
    Then status 201
    And print "response is:", response
    #Then match response $ == {"title": "New Product Added","price": 15,"description": "A description added","images": ["https://placeimg.com/640/480/any"],"category": {"id": 1,"name": "#notnull","image": "#ignore","creationAt": "#ignore","updatedAt": "#ignore"},"id": "#notnull","creationAt": "#ignore","updatedAt": "#ignore"}
    #to show how softasertion works
    # Then match response $ == {"title": "New Product Added","price": 5,"description": "A description added","images": ["https://placeimg.com/640/480/any"],"category": {"id": 1,"name": "#notnull","image": "#ignore","creationAt": "#ignore","updatedAt": "#ignore"},"id": "#notnull","creationAt": "#ignore","updatedAt": "#ignore"}
    Then assert responseStatus == 201 || responseStatus == 200
    And match responseType == 'json'