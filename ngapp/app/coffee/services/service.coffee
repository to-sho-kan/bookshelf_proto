service = angular.module 'bookshelf.services', [
  'ngResource'
]

host = 'http://localhost:3000'

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
      $resource(host + '/users.json').query()
    getById: (userId) ->
      $resource(host + '/users/' + userId + '.json').get({id: userId})
]

###
# 書籍一覧
###
service.factory 'bookService', [
  '$resource'
  ($resource) ->
    getAll: ->
      $resource(host + '/books.json').query()
    getById: (bookId) ->
      $resource(host + '/books/' + bookId + '.json').get({id: bookId})
]
