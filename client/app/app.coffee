'use strict'

angular.module 'csiiApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'btford.socket-io',
  'ui.router',
  'ui.bootstrap',
  'pascalprecht.translate',
  'multi-select'
]

.config ($translateProvider) ->
  $translateProvider
  .translations('en',
    CSII: 'The Circle of Studies of Idea and Ideology',
    BUTTON_TEXT_EN: 'english',
    BUTTON_TEXT_PT: 'portuguese'
  ).translations('pt',
    CSII: 'Círculo de Estudos da Ideia e da Ideologia',
    BUTTON_TEXT_EN: 'inglês',
    BUTTON_TEXT_PT: 'português'
  );
  $translateProvider.determinePreferredLanguage();
  $translateProvider.fallbackLanguage('en');

.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
  $httpProvider.interceptors.push 'authInterceptor'

.factory 'authInterceptor', ($rootScope, $q, $cookieStore, $location) ->
  # Add authorization token to headers
  request: (config) ->
    config.headers = config.headers or {}
    config.headers.Authorization = 'Bearer ' + $cookieStore.get 'token' if $cookieStore.get 'token'
    config

  # Intercept 401s and redirect you to login
  responseError: (response) ->
    if response.status is 401
      $location.path '/login'
      # remove any stale tokens
      $cookieStore.remove 'token'

    $q.reject response

.run ($rootScope, $location, Auth) ->
  # Redirect to login if route requires auth and you're not logged in
  $rootScope.$on '$stateChangeStart', (event, next) ->
    Auth.isLoggedInAsync (loggedIn) ->
      $location.path "/login" if next.authenticate and not loggedIn
