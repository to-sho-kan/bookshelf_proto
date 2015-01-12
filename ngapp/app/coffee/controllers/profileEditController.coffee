###
# プロフィール編集コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'ProfileEditCtrl', [
    '$scope'
    ($scope) ->
      $scope.title = 'プロフィール編集'
  ]
