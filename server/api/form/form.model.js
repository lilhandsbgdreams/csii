'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var FormSchema = new Schema({
  name: String,
  occupation: String,
  education: String,
  languages: Array,
  address: String,
  phone: String,
  email: String,
  days: Array,
  comment: String,
  active: Boolean
});

module.exports = mongoose.model('Form', FormSchema);