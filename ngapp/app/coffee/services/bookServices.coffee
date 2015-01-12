service = angular.module 'bookshelf.services'

###
# 借り物かご
###
service.service 'basketService', [
  () ->
    books: {}
]

###
# 書籍リソース
###
service.factory 'Book', [
  '$resource', 'hostName'
  ($resource, hostName) ->
    $resource(hostName + '/books/:id.json', {id: '@id'})
]

###
# 書籍サービス
###
service.factory 'bookService', [
  'Book'
  (Book) ->
    getAll: ->
      Book.query()
    getById: (bookId) ->
      Book.get({id: bookId})
    update: (book) ->
      Book.save(book)
]
