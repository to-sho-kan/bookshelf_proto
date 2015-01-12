###
# 書籍登録コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'bookNewCtrl', [
    '$scope'
    ($scope) ->
      $scope.title = '書籍登録'
  ]
