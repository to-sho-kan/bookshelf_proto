###
# 書籍一覧コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'bookListCtrl', [
    '$scope', 'basketService', 'bookService'
    ($scope, basketService, bookService) ->
      $scope.title = '書籍一覧'
      $scope.basket = basketService.books

      # 書籍一覧を取得
      $scope.bookList = bookService.getAll()
  ]
