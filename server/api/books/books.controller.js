'use strict';

var _ = require('lodash');
var config = require('../../config/environment');
var https = require('https');

// Get a single books
exports.show = function(req, res) {

    var options = {
      host: 'www.googleapis.com',
      path: '/books/v1/volumes?q=ISBN=' + req.params.isbn + '&key=' + config.GOOGLE_BOOKS_KEY
    };

    var callback = function(response) {
      var books = '';
//      res.writeHead(200, { 'Content-Type': 'application/json' });

      //another chunk of data has been recieved, so append it to `str`
      response.on('data', function (chunk) {
          books += chunk;
      });

      //the whole response has been recieved, so we just print it out here
      response.on('end', function () {
          res.json(JSON.parse(books));
      });
    };

    https.request(options, callback).end();
};

function handleError(res, err) {
  return res.send(500, err);
}