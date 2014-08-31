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

  it 'should contain 7 days in the week', ->
    expect(scope.daysAvailable.length).toBe 7

  it 'should add and remove languages', ->
    scope.formAddLanguage({name: 'English'})
    scope.formAddLanguage({name: 'Russian'})
    scope.formAddLanguage({name: 'Chinese'})
    scope.formDeleteLanguage({name: 'Russian'})
    expect(scope.formData.languages.length).toBe(2)
