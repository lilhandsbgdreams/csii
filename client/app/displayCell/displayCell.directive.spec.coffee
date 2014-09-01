'use strict'

describe 'Directive: displayCell', ->

  # load the directive's module and view
  beforeEach module 'csiiApp'
  beforeEach module 'app/displayCell/displayCell.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

###
  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<display-cell></display-cell>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the displayCell directive'
###

