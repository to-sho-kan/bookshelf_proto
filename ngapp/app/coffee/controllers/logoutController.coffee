###
# ログアウトコントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'logoutCtrl', [
    '$scope', '$timeout', '$location'
    ($scope, $timeout, $location) ->
      $scope.title = 'ログアウトしました'
      $timeout ->
        $location.path('/login/')
      , 100, true
  ]
