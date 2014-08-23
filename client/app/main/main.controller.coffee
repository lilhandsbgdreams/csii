'use strict'

angular.module 'csiiApp'
.controller 'MainCtrl', ($scope, $http, socket, $translate) ->

  ###
  $scope.languages = [
    { id: 'BUTTON_TEXT_PT', code: 'pt' },
    { id: 'BUTTON_TEXT_EN', code: 'en' }
  ]
  ###

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
    { value: 1 },
  ]

  $scope.formAddLanguage = (lang) ->
    $scope.formData.languages.push(lang)
    $scope.lingua = {name: ''}

  $scope.formDeleteLanguage = (lang) ->
    i = $scope.formData.languages.indexOf(lang)
    $scope.formData.languages.splice(i,1)


  $scope.changeLanguage = (code) ->
    $translate.use code

###

  $scope.awesomeThings = []

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings
    socket.syncUpdates 'thing', $scope.awesomeThings

  $scope.addThing = ->
    return if $scope.newThing is ''
    $http.post '/api/things',
      name: $scope.newThing

    $scope.newThing = ''

  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'thing'###
