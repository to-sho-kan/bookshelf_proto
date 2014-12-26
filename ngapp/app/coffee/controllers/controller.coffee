controller = angular.module 'bookshelf.controllers', []

###
# ナビコントローラ 
###
controller.controller 'navCtrl', ['$scope', ($scope) ->
  $scope.nav = 
    home: true
    rental: true
    book: true
    userNew: true
    logout: true
    admin: true
    users: true

  $scope.userId = 1

  $scope.$on 'navChange', (event, state, type) ->
    switch state
      when 'requireLogin'
        # 要ログイン
        $scope.nav.home = false
        $scope.nav.rental = false
        $scope.nav.book = false
        $scope.nav.home = false
        $scope.nav.logout = false
        $scope.nav.users = false
        $scope.nav.userNew = true
      when 'LoggedIn'
        # ログイン済
        $scope.nav.home = true
        $scope.nav.book = true
        $scope.nav.userNew = false
        $scope.nav.logout = true
        if type is 'user'
          # 利用者
          $scope.nav.rental = true
          $scope.nav.users = false
          $scope.nav.admin = false
        else
          # 管理者
          $scope.nav.rental = false
          $scope.nav.users = true
          $scope.nav.admin = true
      else
]

### 共通 ###

###
# ルートコントローラ
###
controller.controller 'rootCtrl', ['$location', ($location) ->
#  $location.path('/home/')
#  $location.path('/admin/')
  $location.path('/login/')
]

###
# ログインコントローラ 
###
controller.controller 'loginCtrl', [
  '$scope', '$location', '$http',
  ($scope, $location, $http) ->
    $scope.title = 'ログイン'
    $scope.user = 
      name: ''
      password: ''
      remember: false

    # ログイン処理
    $scope.login = ->
      # サーバー側へ問い合わせ
      ###
      $http
        method: 'POST'
        url: '/api/login'
        data: $scope.user
      ###
      $location.path('/home/')
]

###
# ログアウトコントローラ
###
controller.controller 'logoutCtrl', ['$scope', '$timeout', '$location', 
  ($scope, $timeout, $location) ->
    $scope.title = 'ログアウトしました'
    $timeout ->
      $location.path('/login/')
    , 100, true
]

###
# ユーザー登録コントローラ
###
controller.controller 'userRegistrationCtrl', [
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

###
# 書籍一覧コントローラ
###
controller.controller 'bookListCtrl', [
  '$scope', 'basketService', 'bookService'
  ($scope, basketService, bookService) ->
    $scope.title = '書籍一覧'
    $scope.basket = basketService.books

    # 書籍一覧を取得
    $scope.bookList = bookService.getAll()
]

###
# 書籍詳細コントローラ
###
controller.controller 'bookDetailCtrl', [
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

### 利用者 ###

###
# ホームコントローラ 
###
controller.controller 'homeCtrl', ['$scope', ($scope) ->
  $scope.title = 'ホーム'
]

###
# プロフィール確認コントローラ
###
controller.controller 'ProfileCtrl', ['$scope', ($scope) ->
  $scope.title = 'プロフィール確認'
]

###
# プロフィール編集コントローラ
###
controller.controller 'ProfileEditCtrl', ['$scope', ($scope) ->
  $scope.title = 'プロフィール編集'
]

###
# 貸出コントローラ
###
controller.controller 'borrowCtrl', ['$scope', ($scope) ->
  $scope.title = '貸出'
]

###
# 借用中・履歴一覧・返却コントローラ
###
controller.controller 'rentalListCtrl', ['$scope', ($scope) ->
  $scope.title = 'レンタルリスト'
]

### 管理者ホーム ###
controller.controller 'adminCtrl', ['$scope', ($scope) ->
  $scope.title = '管理者ホーム'
]

###
# ユーザー一覧コントローラ
###
controller.controller 'userListCtrl', [
  '$scope', '$http', 'userService',
  ($scope, $http, userService) ->
    $scope.title = 'ユーザー一覧'

    $scope.userList = userService.getAll()
]

###
# ユーザー詳細コントローラ
###
controller.controller 'userCtrl', [
  '$scope', 'userService',
  ($scope, userService) ->
    $scope.title = 'ユーザー詳細'
    $scope.user =
      { userId: 1, name: 'Nanashi1', createdTime: '2014-01-01', memo: 'memo1' }
]

###
# ユーザー編集コントローラ
###
controller.controller 'userEditCtrl', ['$scope', ($scope) ->
  $scope.title = 'ユーザー編集'
]

###
# 貸出コントローラ
###
controller.controller 'rentalCtrl', ['$scope', ($scope) ->
  $scope.title = '貸出'
]

###
# 書籍登録コントローラ
###
controller.controller 'bookNewCtrl', ['$scope', ($scope) ->
  $scope.title = '書籍登録'
]

###
# 書籍編集コントローラ
###
controller.controller 'bookEditCtrl', ['$scope', ($scope) ->
  $scope.title = '書籍編集'
]

###
# 貸借操作コントローラ
###
controller.controller 'rentalOperationCtrl', ['$scope', ($scope) ->
  $scope.title = '貸借操作'
]
