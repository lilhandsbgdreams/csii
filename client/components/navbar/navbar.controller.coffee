'use strict'

angular.module 'csiiApp'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->
  $scope.menu = [
    {
      title: 'Home'
      link: '/'
      translation: 'HOME'
    },
    {
      title: 'Texts'
      link: '/texts'
      translation: 'TEXT'
    },
    {
      title: 'Operations'
      link: '/operations'
      translation: 'OPERATIONS'
    },
    {
      title: 'Project'
      link:'/project'
      translation: 'PROJECT'
    },
    {
      title: 'Inscription'
      link:'/inscription'
      translation: 'INSCRIPTION'
    },
    {
      title: 'Contact'
      link: '/contact'
      translation: 'CONTACT'
    }
  ]
  $scope.isCollapsed = true
  $scope.isLoggedIn = Auth.isLoggedIn
  $scope.isAdmin = Auth.isAdmin
  $scope.getCurrentUser = Auth.getCurrentUser

  $scope.logout = ->
    Auth.logout()
    $location.path '/login'

  $scope.isActive = (route) ->
    route is $location.path()