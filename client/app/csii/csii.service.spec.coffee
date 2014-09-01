'use strict'

describe 'Service: csii', ->

  # load the service's module
  beforeEach module 'csiiApp'

  # instantiate service
  csii = undefined
  beforeEach inject (_csiiFactory_) ->
    csii = _csiiFactory_

  it 'should do something', ->
    expect(!!csii).toBe true
