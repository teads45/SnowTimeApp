//
//
//Yelp fusion integration (snowTime)
//
//Thomas Eads 6/25/2020 

//this is all the stuff you'll need in this file

'use strict';
var http = require('http');
var yelp = require('yelp-fusion');
var bodyParser = require('body-parser');

//yelp API key -- // from https://www.yelp.com/developers/v3/manage_app
const apiKey = 'thbwyY1lg0-9YAYhUpKYDlSgpJhJkrZQgQv1VYUJkDljgZUlw-wKU9i_nEUeNLwF01n8S4IovCt8vTWzi1iTdjdvhJemzapfWmEWLLPhdfxbu64YXMgOGFTO8IrzXnYx';

const express = require('express');
const app = express();
var cors = require('cors');

const client = yelp.client(apiKey);

//Client ID from yelp 
//JODMOZrCpsawbhUjvwnHuA

const searchRequest = {
  term:'Ski Resorts',
  location: 'park city UT'
};

app.get('/lodgeResults', function (req, res) {
    client.search(searchRequest).then(response => {
  	const firstResult = response.jsonBody.businesses[0];
  	const prettyJson = JSON.stringify(firstResult, null, 4);
  	console.log(prettyJson);
//  print(prettyJson);
 res.send(prettyJson);
}).catch(e => {
  console.log(e);
});
});


app.use(cors());
//app.use(bodyParser.json());

app.get('/', function (req, res, next) {
  res.json({msg: 'This is CORS-enabled for all origins!'})
})

app.listen(8080, function () {
  console.log('CORS-enabled web server listening on port 8080')
})
/*
app.get('/lodgeResults', function (req, res) {
  var yelpGetLodge = "prettyJson"
  con.query(sql_select, function (err, result) {
    if (err) throw err;
    console.log("lodge pulled");
    res.send(prettyJson);
  })
})
*/


//this is express used to get and post the response from yelp
app.get('/lodgeResults', function (req, res) {
  const firstResult = response.jsonBody.businesses[0];
    if (err) throw err 
    console.log("info captured");
    console.log(prettyJson);
  })



// this is how the server is created. 
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("Hello World!");
  res.end();
})
.listen();









































var hello_world = "hello world!"


















/*
app.use(bodyParser.json());
app.use(function (requires) {
res.setHeader('hello_world'
res.write('looks here'
res.end(JSON.stringify(firstResult,null,4);
console.log (
app.listen(8080, function () {
  console.log('web server listening on port 8080')
});
*/















/*
var obj = JSON.parse(prettyJson)

alert (obj.name);
alert (obj.rating);
alert (obj.price);
alert (obj.distance);
alert (obj.display_address);
*/





















//= 'thbwyY1lg0-9YAYhUpKYDlSgpJhJkrZQgQv1VYUJkDljgZUlw-wKU9i_nEUeNLwF01n8S4IovCt8vTWzi1iTdjdvhJemzapfWmEWLLPhdfxbu64YXMgOGFTO8IrzXnYx';
