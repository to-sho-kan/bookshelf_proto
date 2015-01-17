###
# ログインコントローラ 
###
angular.module 'bookshelf.controllers'
  .controller 'loginCtrl', [
    '$scope', '$location', '$http'
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
