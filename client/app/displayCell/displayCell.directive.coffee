'use strict'

angular.module 'csiiApp'
.directive 'displayCell', ->
  templateUrl: 'app/displayCell/displayCell.html'
  restrict: 'EA'
  scope:
    cellData: '=cellData'
    format: "=format"
  controller: ($scope, CSIIFactory) ->
    if $scope.cellData.book
      CSIIFactory.getBookData $scope.cellData.book
        .then (response) ->
          if response.data.items
            bookInfo = if response.data.items.length then response.data.items[0].volumeInfo else response.data.items.volumeInfo
            $scope.book =
                name: if bookInfo.subtitle then bookInfo.title + ':' + bookInfo.subtitle else bookInfo.title
                authors: bookInfo.authors
                publisher: bookInfo.publisher
                publicationDate: bookInfo.publishedDate
                pages: bookInfo.pageCount
                imageLink: bookInfo.imageLinks.smallThumbnail

    #        console.log bookInfo