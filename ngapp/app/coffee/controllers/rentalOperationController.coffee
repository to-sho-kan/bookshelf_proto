###
# 貸借操作コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'rentalOperationCtrl', [
    '$scope'
    ($scope) ->
      $scope.title = '貸借操作'
  ]
