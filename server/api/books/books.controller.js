'use strict';

var _ = require('lodash');
var config = require('../../config/environment');
var request = require('request');

// Get a single books
exports.show = function(req, res) {

    var options = {
        proxy: process.env.QUOTAGUARDSTATIC_URL,
        url: 'https://www.googleapis.com/books/v1/volumes?q=ISBN=' + req.params.isbn + '&key=' + process.env.GOOGLEBOOKS_KEY,
        headers: {
            'User-Agent': 'node.js'
        }
    };

    var callback = function(err, response, body) {

        if (err) console.log(err);

        return body;
    };

    req.pipe(request(options, callback)).pipe(res);
};

function handleError(res, err) {
  return res.send(500, err);
}