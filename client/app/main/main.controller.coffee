'use strict'

angular.module 'csiiApp'
.controller 'MainCtrl', ($scope, socket, $translate, CSIIFactory) ->

  $scope.cells = CSIIFactory.getCellData()

  $scope.cellFormat =
    width: 100
    height: 100

  $scope.formData = { languages: [] }

  $scope.daysAvailable = [
    { name: 'Sunday', ticked: false }
    { name: 'Monday', ticked: false }
    { name: 'Tuesday', ticked: false }
    { name: 'Wednesday', ticked: false }
    { name: 'Thursday', ticked: false }
    { name: 'Friday', ticked: false }
    { name: 'Saturday', ticked: false }
  ];

  $scope.circlePercent = [
    value: 1
  ]

  $scope.formAddLanguage = (lang) ->
    $scope.formData.languages.push(lang)
    $scope.lingua = {name: ''}

  $scope.formDeleteLanguage = (lang) ->
    i = $scope.formData.languages.indexOf(lang)
    $scope.formData.languages.splice(i,1)

  $scope.changeLanguage = (code) ->
    $translate.use code