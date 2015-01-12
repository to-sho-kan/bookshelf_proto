app = angular.module 'bookshelf', [
  'bookshelf.constant'
  'bookshelf.controllers'
  'bookshelf.services'
  'bookshelf.filters'
  'bookshelf.directives'
  'ui.bootstrap'
  'ngRoute'
  'ngMessages'
]

app.run [
  '$rootScope'
  ($rootScope) ->
    $rootScope.$on '$routeChangeStart', ->
      state = 'requireLogin'
      type = 'user'
#      $rootScope.$broadcast 'navChange', state, type
]
