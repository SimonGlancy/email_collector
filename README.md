# EmailCollector

#### Background

The purpose of this app is to store webhook data sent from an external source in a database that can be queried to produce a JSON object with the relevant information.

I have made a conscious step to not provide any views, my reasoning was that this app would function as a microservice or external API that would be consumed by a dashboard program or some other front end application.

#### App details

The app is built using Rails (v5.0.0.1) and Ruby (v2.2.2) with additional Gems responders for producing the JSON output and rack-cors to enable cross origin requests.

the app contains two routes:

* #index - This is the get route ('/') that presents the information requested (total number of emails sent, total number of emails opened, total number of clicks, open rate per email type, click rate per email type)

* #create - This is a post route ('/emails') that creates a new instance in the postgresql data base Email table with the following columns( Address, EmailType, Event, Timestamp)

#### Launching the app
The code is fully unit tested using rspec.

To launch clone repo:

`$ bundle`

`$ rspec`

`$ rails s`

visit http://localhost:3000/

##### Issues:

To test the program a webhook mimicing piece of software was supplied called llirdnam built in go. This provided me with a number of issues and has lead to me creating multiple branches.

1). The webhook data was provided in JSON format but in camel case meaning that column/method names had to be in CamelCase which felt like a very un-Ruby solution.

2). The POST method supplied by llirdnam did not post information as params in a format expected and so had to be parsed using JSON.parse(request.body.read).

The program has been tested in three ways:

1). Rspec unit tests

2). Using curl to assess whether post actions are received in the database:

`curl -H "Content-Type: application/json" -X POST -d '{"Address":"vitor@lostmy.name","EmailType":"Shipment","Event":"open","Timestamp":1432820704}' http://localhost:3000/emails`

3). Using the llirdnam command

`go run llirdnam.go http://localhost:3000/emails.json`

#### Branches:

There are three branches with differing test coverage:

##### llirdnam-Solution
Can receive data from llirdnam and curl. 1 test failing in Rspec due to format issues.

##### Tests-Passing-llirdnam-Syntax
All tests passing (params.permit implemented) and responsive to curl. llirdnam tasks not working. Database and JSON written in CamelCase.

#### Tests-Passing-Preferred-Syntax
All tests passing (params.permit implemented) and responsive to curl. llirdnam tasks not working. Database and JSON written in preferred snake_case.
