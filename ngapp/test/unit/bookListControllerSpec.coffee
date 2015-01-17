describe '書籍管理リストのコントローラのテスト', ->
  beforeEach module('bookshelf.constant')
  beforeEach module('bookshelf.services')
  beforeEach module('bookshelf.controllers')
  hostName = 'http://localhost:3000'

  describe '書籍知覧コントローラのテスト', ->
    scope = undefined
    ctrl = undefined
    $httpBackend = undefined

    beforeEach inject (_$httpBackend_, $rootScope, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.expectGET hostName + '/books.json'
        .respond [
          {id: 1, title: 'title1', author: 'auth1', publisher: 'pub1', issueDate: '2015-01-01'}
          {id: 2, title: 'title2', author: 'auth2', publisher: 'pub2', issueDate: '2015-01-02'}
          {id: 3, title: 'title3', author: 'auth3', publisher: 'pub3', issueDate: '2015-01-03'}
        ]

      scope = $rootScope.$new()
      ctrl = $controller 'bookListCtrl',
        $scope: scope

    it 'タイトル名が「書籍一覧」であること', ->
      expect(scope.title).toEqual('書籍一覧')

    it '書籍一覧が空であること', ->
      expect(scope.bookList).toEqual([])

    it '書籍一覧が正しく読み込まれていること', ->
      $httpBackend.flush()
      expect(scope.bookList.length).toEqual(3)
