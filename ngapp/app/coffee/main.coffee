app = angular.module 'bookshelf', [
	'bookshelf.controllers'
	'bookshelf.services'
	'bookshelf.filters'
	'bookshelf.directives'
	'ui.bootstrap'
	'ngRoute'
  'ngMessages'
  'ngMockE2E'
]

app.run [
	'$rootScope', '$httpBackend'
	($rootScope, $httpBackend) ->
    $rootScope.$on '$routeChangeStart', ->
      state = 'requireLogin'
      type = 'user'
#      $rootScope.$broadcast 'navChange', state, type
    
    $httpBackend.whenGET /\.\.\/views\// 
    .passThrough()

    $httpBackend.whenGET '/users'
    .respond 200, [
        { id: 1, firstName: 'Nanashi1', lastName: 'san', createdAt: '2014-12-21T17:32:21+09:00', memo: 'memo1'}
        { id: 2, firstName: 'Nanashi2', lastName: 'san', createdAt: '2014-12-21T17:32:21+09:00', memo: 'memo2'}
        { id: 3, firstName: 'Nanashi3', lastName: 'san', createdAt: '2014-12-21T17:32:21+09:00', memo: 'memo3'}
        { id: 4, firstName: 'Nanashi4', lastName: 'san', createdAt: '2014-12-21T17:32:21+09:00', memo: 'memo4'}
      ], {}

    $httpBackend.whenGET '/books'
    .respond 200, [
        { id: 1, bookId: 1, title: 'Book1', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 0 }
        { id: 2, bookId: 2, title: 'Book2', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 0 }
        { id: 3, bookId: 3, title: 'Book3', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 0 }
        { id: 4, bookId: 4, title: 'Book4', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 0 }
        { id: 5, bookId: 5, title: 'Book5', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 1 }
        { id: 6, bookId: 6, title: 'Book6', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 1 }
        { id: 7, bookId: 7, title: 'Book7', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 2 }
        { id: 8, bookId: 8, title: 'Book8', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 0 }
        { id: 9, bookId: 9, title: 'Book9', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 0 }
        { id: 10, bookId: 10, title: 'Book10', author: 'hoge1', publisher: 'someone', issueDate: '2014-12-21T17:32:21+09:00', state: 0 }
      ], {}
]
