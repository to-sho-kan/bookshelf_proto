###
# ユーザー編集コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'userEditCtrl', [
    '$scope','$location', '$routeParams','userService',
    ($scope, $location, $routeParams, userService) ->
      $scope.title = 'ユーザー編集'
      $scope.editable = true

      userId = $routeParams.userId
      $scope.user = userService.getById(userId)

      $scope.update = ->
        # 保存処理
  #      userService.update($scope.user)
        $location.path "/user/#{userId}"

      $scope.cancel = ->
        $location.path "/user/#{userId}"
  ]
