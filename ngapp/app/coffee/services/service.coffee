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
# ユーザーリソース
###
service.factory 'User', [
  '$resource'
  ($resource) ->
    $resource(host + '/users/:id.json', {id: '@id'})
]

###
# ユーザーサービス
###
service.factory 'userService', [
  'User'
  (User) ->
    getAll: ->
#      $resource(host + '/users:json').query()
      User.query()
    getById: (userId) ->
      User.get({id: userId})
    update: (user) ->
      User.save(user)
#      $resource(host + '/users/:id', {id: '@id'}).$save()
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
