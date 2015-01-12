###
# ユーザー登録コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'userRegistrationCtrl', [
    '$scope', '$location',
    ($scope, $location) ->
      $scope.title = 'ユーザー登録'

      $scope.user =
        name: ''
        password: ''
        email: ''

      # 登録
      $scope.register = ->
        console.log($scope.user)

      # キャンセル
      $scope.cancel = ->
        $location.path '/login/'
  ]
