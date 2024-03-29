'use strict'

angular.module('app.core').run ($rootScope, $location, $anchorScroll, $state, perPage) ->

  $rootScope.perPage = perPage

  # binding this so $state.current.data.pageTitle & other $state data can be accessed
  $rootScope.$state = $state

  $rootScope.scrollTo = (location) ->
    search = angular.copy $location.search()
    $location.hash location
    $anchorScroll()
    $location.url $location.path()
    $location.search search
    return

  $rootScope.$on '$stateChangeSuccess', () ->
    $rootScope.scrollTo 'body-top'
    return

  return
