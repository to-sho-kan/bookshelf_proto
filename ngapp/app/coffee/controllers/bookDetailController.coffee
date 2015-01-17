###
# 書籍詳細コントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'bookDetailCtrl', [
    '$scope', '$routeParams', '$location', 'basketService', 
    ($scope, $routeParams, $location, basketService) ->
      $scope.title = '書籍詳細'

      $scope.book = 
        libraryId: $routeParams.libraryId
        bookId: 1
        name: 'Book1'
        author: 'hoge1'
        state: 0

      # 借りられるかの判断
      $scope.canBorrow = ->
        return $scope.book.state is 0 and
                basketService.books[$scope.book.libraryId] isnt true

      # 借り物かごに追加する
      $scope.addBasket = ->
        basketService.books[$scope.book.libraryId] = true
        $location.path('/book/')

      # 借り物かごからはずす
      $scope.popBasket = ->
        basketService.books[$scope.book.libraryId] = false
        $location.path('/book/')

      # 一覧へ戻る
      $scope.backToList = ->
        $location.path('/book/')
  ]
