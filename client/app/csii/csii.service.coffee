'use strict'

angular.module 'csiiApp'
.factory 'CSII', ($http) ->
  getCellData: () ->
    [
      name: 'RJ I'
      location: 'Travessa do Ouvidor, n.21/701 – Centro'
      city: 'Rio De Janeiro'
      country: 'Brazil'
      progress: .5
      book:  ''
      news: ''
    ,
      name: 'RJ II'
      location: 'Travessa do Ouvidor, n.21/701 – Centro'
      city: 'Rio De Janeiro'
      country: 'Brazil'
      progress: .7
      book: ''
      news: ''
    ,
      name: 'SP'
      location: 'Av. Paulista, n.2073/17o andar – Horsa II – sala 1702, Consolação'
      city: 'Sao Paulo'
      country: 'Brazil'
      progress: .4
      book: ''
      news: ''
    ]

  getBookData: (isbn) ->
    $http.get '/api/books/' + isbn