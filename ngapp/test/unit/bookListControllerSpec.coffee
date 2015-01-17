describe '書籍一覧コントローラのテスト', ->
  scope = undefined
  ctrl = undefined
  $httpBackend = undefined

  beforeEach module('bookshelf.constant')
  beforeEach module('bookshelf.services')
  beforeEach module('bookshelf.controllers')

  beforeEach inject (_$httpBackend_, $rootScope, $controller, hostName) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET hostName + '/books.json'
      .respond [
        {
          id: 1
          title: 'title1'
          author: 'auth1'
          publisher: 'pub1'
          issueDate: '2015-01-01'
        }
        {
          id: 2
          title: 'title2'
          author: 'auth2'
          publisher: 'pub2'
          issueDate: '2015-01-02'
        }
        {
          id: 3
          title: 'title3'
          author: 'auth3'
          publisher: 'pub3'
          issueDate: '2015-01-03'
        }
      ]

    scope = $rootScope.$new()
    ctrl = $controller 'bookListCtrl',
      $scope: scope

  it 'タイトル名が「書籍一覧」であること', ->
    expect(scope.title).toEqual('書籍一覧')

  it '書籍一覧が正しく読み込まれること', ->
    $httpBackend.flush()
    expect(scope.bookList.length).toEqual(3)
    expect(scope.bookList[0].title).toEqual('title1')
