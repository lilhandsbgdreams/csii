/**
 * Broadcast updates to client when the model changes
 */

'use strict';

var Cells = require('./cells.model');

exports.register = function(socket) {
  Cells.schema.post('save', function (doc) {
    onSave(socket, doc);
  });
  Cells.schema.post('remove', function (doc) {
    onRemove(socket, doc);
  });
}

function onSave(socket, doc, cb) {
  socket.emit('cells:save', doc);
}

function onRemove(socket, doc, cb) {
  socket.emit('cells:remove', doc);
}