### 管理者ホーム ###
angular.module 'bookshelf.controllers'
  .controller 'adminCtrl', [
    '$scope'
    ($scope) ->
      $scope.title = '管理者ホーム'
  ]
