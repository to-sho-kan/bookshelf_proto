###
# プロフィール確認コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'ProfileCtrl', [
    '$scope'
    ($scope) ->
      $scope.title = 'プロフィール確認'
  ]
