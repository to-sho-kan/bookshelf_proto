service = angular.module 'bookshelf.services'

###
# 貸出中書籍リソース
###
service.factory 'CheckOutBook', [
  '$resource', 'hostName'
  ($resource, hostName) ->
    $resource hostName + '/users/:id/books.json', 
      id: '@id'
      status: status
]

###
# 貸出中書籍一覧
###
service.factory 'checkoutBookService', [
  'CheckOutBook'
  (CheckOutBook) ->
    getAll: (userId, status) ->
      CheckOutBook.query
        id: userId
        status: status
    getById: (bookId) ->
      console.log(hostName + '/users/' + userId + '/books.json')
]
