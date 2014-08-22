'use strict'

angular.module 'csiiApp'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->
  $scope.menu = [
    {
      title: 'Home'
      link: '/'
    },
    {
      title: 'Texts'
      link: '/texts'
    },
    {
      title: 'Operations'
      link: '/operations'
    },
    {
      title: 'Project'
      link:'/project'
    },
    {
      title: 'Inscription'
      link:'/inscription'
    },
    {
      title: 'Contact'
      link: '/contact'
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