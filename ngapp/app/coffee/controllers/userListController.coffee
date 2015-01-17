###
# ユーザー一覧コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'userListCtrl', [
    '$scope', '$http', 'userService',
    ($scope, $http, userService) ->
      $scope.title = 'ユーザー一覧'

      $scope.userList = userService.getAll()
  ]
