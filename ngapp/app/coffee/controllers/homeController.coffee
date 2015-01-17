###
# ホームコントローラ 
###
angular.module 'bookshelf.controllers'
  .controller 'homeCtrl', [
    '$scope'
    ($scope) ->
      $scope.title = 'ホーム'
  ]
