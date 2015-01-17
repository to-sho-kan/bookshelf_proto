###
# ルートコントローラ
###
angular.module 'bookshelf.controllers'
  .controller 'rootCtrl', [
    '$location'
    ($location) ->
    #  $location.path('/home/')
    #  $location.path('/admin/')
      $location.path('/login/')
  ]
