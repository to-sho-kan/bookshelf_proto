###
# 書籍編集コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'bookEditCtrl', [
    '$scope'
    ($scope) ->
      $scope.title = '書籍編集'
  ]
