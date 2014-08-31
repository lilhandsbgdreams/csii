'use strict'

angular.module 'csiiApp'
.directive 'displayCell', ->
  templateUrl: 'app/displayCell/displayCell.html'
  restrict: 'EA'
  scope:
    cellData: '=cellData'
  controller: ($scope) ->
    console.log $scope.cellData