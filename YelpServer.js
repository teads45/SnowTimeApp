//this is all the stuff you'll need in this file
var http = require('http');
const express = require('express');
const app = express();
var cors = require('cors');
//var request = require("request")

const apiKey = "thbwyY1lg0-9YAYhUpKYDlSgpJhJkrZQgQv1VYUJkDljgZUlw-wKU9i_nEUeNLwF01n8S4IovCt8vTWzi1iTdjdvhJemzapfWmEWLLPhdfxbu64YXMgOGFTO8IrzXnYx"

const yelp = require('yelp-fusion');

const searchRequest = {
  term: 'ski_Resorts',
  location: 'Salt Lake City',
};

app.get('/', function (req, res, next) {

const client = yelp.client(apiKey);

client.search(searchRequest)
  .then((response) => {
    res.json(response.jsonBody);
  })
  .catch((error) => {
    console.log(error);
  });
})

app.use(cors());

app.get('/', function (req, res, next) {
  res.json({msg: 'This is CORS-enabled for all origins!'})
})



app.listen(8080, function () {
  console.log('CORS-enabled web server listening on port 8080')
})


// this is how the server is created. 
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("Hello World!");
  res.end();
})
.listen();






















//let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude=\(longitude)&categories=\(category)&limit=\(limit)&sort_by=\(sortBy)&locale=\(locale)"


//let apikey = "thbwyY1lg0-9YAYhUpKYDlSgpJhJkrZQgQv1VYUJkDljgZUlw-wKU9i_nEUeNLwF01n8S4IovCt8vTWzi1iTdjdvhJemzapfWmEWLLPhdfxbu64YXMgOGFTO8IrzXnYx"