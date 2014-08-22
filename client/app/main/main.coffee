'use strict'

angular.module 'csiiApp'
.config ($stateProvider) ->
  $stateProvider

  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'

  .state 'texts',
    url: '/texts'
    templateUrl: 'app/main/texts.html'
    controller: 'TextCtrl'

  .state 'operations',
    url: '/operations'
    templateUrl: 'app/main/operations.html'
    controller: 'MainCtrl'

  .state 'project',
    url: '/project'
    templateUrl: 'app/main/project.html'
    controller: 'MainCtrl'

  .state 'inscription',
    url: '/inscription'
    templateUrl: 'app/main/inscription.html'
    controller: 'MainCtrl'

  .state 'contact',
    url: '/contact'
    templateUrl: 'app/main/contact.html'
    controller: 'MainCtrl'