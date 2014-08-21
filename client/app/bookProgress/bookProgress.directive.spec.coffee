'use strict'

describe 'Directive: bookProgress', ->

  # load the directive's module and view
  beforeEach module 'csiiApp'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

###
  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<book-progress></book-progress>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the bookProgress directive'

###
