###
# ナビコントローラ 
###
angular.module 'bookshelf.controllers'
  .controller 'navCtrl', [
    '$scope'
    ($scope) ->
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
