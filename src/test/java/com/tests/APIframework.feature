Feature: json karate demo


Background: api end point url
* url 'http://localhost:3000/posts'


Scenario: Create a new post request
# hitting post request
#Given url 'http://localhost:3000/posts'
And request {"title": "json-server","author": "typicode"}
When method post
Then status 201
# printing the post request
And print "response is:" , response
Then match response == {"title": "json-server","author": "typicode","id":#notnull}
Then assert responseTime < 4000


Scenario: get created post details
#defining postid and storing the value of id in it
#Given url 'http://localhost:3000/posts'
And request {"title": "json-server","author": "typeicode"}
When method post
Then status 201
And def postId = response.id
Given url 'http://localhost:3000/posts'
And path postId
When method get
Then status 200
And print "response is:" , response
Then assert responseTime < 4000

Scenario: get put request
#hitting post request
#Given url 'http://localhost:3000/posts'
And request {"title": "json-server","author": "typeicode"}
When method post
Then status 201
And def postId = response.id
Given url 'http://localhost:3000/posts'
And path postId
And request {"title": "json-server-new","author": "typer"}
When method put
Then status 200
And print "response is:", response
Then assert responseTime < 4000


Scenario: DEleting the request
#Given url 'http://localhost:3000/posts'
And request {"title": "json-server","author": "typicode"}
When method post
Then status 201
And def postId = response.id
Given url 'http://localhost:3000/posts'
And path postId
When method delete
Then status 200
And print "response is:", response
Then assert responseTime < 4000





