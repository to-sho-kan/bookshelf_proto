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
# ユーザーリソース
###
service.factory 'userService', [
	'$resource'
	($resource) ->
		resource = $resource('/api/client/:id', {id: '@userId'})
		return resource
]

###
# ユーザー一覧
###
service.factory 'userListService', [
	'userService'
	(userService) ->
		return userService.query()
]

###
# 書籍一覧
###
service.factory 'bookListService', [
	'$resource'
	($resource) ->
		resource = $resource('/api/book/')
]
