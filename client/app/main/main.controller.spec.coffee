'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'csiiApp'
  beforeEach module 'socketMock'

  MainCtrl = undefined
  scope = undefined
  $httpBackend = undefined

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/api/things').respond [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
      'Express'
    ]
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl',
      $scope: scope

  it 'should agree that 1 = 1', ->
    expect(1).toBe 1
