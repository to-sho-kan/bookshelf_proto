service = angular.module 'bookshelf.services'

###
# ユーザーリソース
###
service.factory 'User', [
  '$resource', 'hostName'
  ($resource, hostName) ->
    $resource(hostName + '/users/:id.json', {id: '@id'})
]

###
# ユーザーサービス
###
service.factory 'userService', [
  'User'
  (User) ->
    getAll: ->
      User.query()
    getById: (userId) ->
      User.get({id: userId})
    update: (user) ->
      User.save(user)
]
