###
# 借用中・履歴一覧・返却コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'rentalListCtrl', [
    '$scope', '$routeParams', 'checkoutBookService',
    ($scope, $routeParams, checkoutBookService) ->
      $scope.title = 'レンタルリスト'

      userId = $routeParams.userId
      $scope.bookList = checkoutBookService.getAll(userId)
  ]
