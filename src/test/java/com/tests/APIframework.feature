Feature: json karate demo


Background: api end point url
* url 'http://localhost:3000/posts'

@ignore
Scenario: Create a new post request

# hitting post request
#Given url 'http://localhost:3000/posts'
And request {"title": "json-server","author": "typicode"}
When method post
Then status 201
# printing the post request
And print "response is:" , response

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

Scenario: get patch request
#Given url 'http://localhost:3000/posts'
And request {"title": "json-server","author": "typicode"}
When method post
Then status 201
And def postId = response.id
Given url 'http://localhost:3000/posts'
And path postId
And request {"title": "teacher","author": "reading"}
When method patch
Then status 200
And print "response is:", response

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



