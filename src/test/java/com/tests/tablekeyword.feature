Feature: Table Keyword

  Scenario: caling from ddtframework
    * table posts
    |title     |price  |description    |categoryId  |images
    |'title3'  |19     |'desp3'        |3           |'https://i.imgur.com/9LFjwpI.jpeg"'
    |'title4'  |20     |'desp4'        |4           |'https://i.imgur.com/vzrTgUR.jpeg'
    
    #* call read("ddtframework.feature") posts
    * call read('@post') posts
    
    @ignore @post
    Scenario: Create a product using PUT Request
    Given url 'https://api.escuelajs.co/api/v1/products'
    And request {"title": "#(title)","price":"#(price)" ,"description": "#(description)","categoryId": "#(categoryId)","images": ["#(images)"]}
    When method POST
    Then status 201
    And print "response is:", response 
    Then assert responseStatus == 201 || responseStatus == 200
    And match responseType == 'json'