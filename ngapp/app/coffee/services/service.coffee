service = angular.module 'bookshelf.services', [
  'ngResource'
]

###
# 共有オブジェクト
###
service.service 'sharedStateService', [
  () ->
    type: ''
    userId: ''
]

###
# 借り物かご
###
service.service 'basketService', [
  () ->
    books: {}
]

###
# ユーザーサービス
###
service.factory 'userService', [
  '$resource'
  ($resource) ->
    getAll: ->
      $resource('/users.json').query()
    getById: (userId) ->
      $resource('/users/' + userId + '.json').get({id: userId})
]

###
# 書籍一覧
###
service.factory 'bookService', [
  '$resource'
  ($resource) ->
    getAll: ->
      $resource('/books').query()
    getById: (bookId) ->
      $resource('/books/' + bookId + '.json').get({id: bookId})
]
