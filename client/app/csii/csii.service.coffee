'use strict'

angular.module 'csiiApp'
.factory 'CSIIFactory', ($http) ->
  getCellData: () ->
    [
      name: 'RJ I'
      location: 'Travessa do Ouvidor, n.21/701 – Centro'
      city: 'Rio De Janeiro'
      country: 'Brazil'
      progress: [ { value: .5 } ]
      book:  '9780804744713'
      news: ''
      nextMeeting: '19 DE AGOSTO'
    ,
      name: 'RJ II'
      location: 'Travessa do Ouvidor, n.21/701 – Centro'
      city: 'Rio De Janeiro'
      country: 'Brazil'
      progress: [ { value: .7 } ]
      book: '9780860919711'
      news: ''
      nextMeeting: '15 DE AGOSTO'
    ,
      name: 'SP'
      location: 'Av. Paulista, n.2073/17o andar – Horsa II – sala 1702, Consolação'
      city: 'Sao Paulo'
      country: 'Brazil'
      progress: [ { value: .4 } ]
      book: '9781844673018'
      news: ''
      nextMeeting: 'EM RECESSO'
    ]

  getBookData: (isbn) ->
    $http.get '/api/books/' + isbn