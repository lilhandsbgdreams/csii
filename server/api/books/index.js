'use strict';

var express = require('express');
var controller = require('./books.controller');

var router = express.Router();

router.get('/:isbn', controller.show);

module.exports = router;