###
# ユーザー詳細コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'userCtrl', [
    '$scope','$location', '$routeParams','userService',
    ($scope, $location, $routeParams, userService) ->
      $scope.title = 'ユーザー詳細'
      $scope.editable = false
      userId = $routeParams.userId
      $scope.user = userService.getById(userId)

      # 編集画面へ遷移
      $scope.changeEdit = ->
        $location.path "/user/#{userId}/edit"
  ]
