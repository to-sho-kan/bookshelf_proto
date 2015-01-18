describe '顧客詳細コントローラのテスト', ->
  $httpBackend = undefined
  $location = undefined
  $rootScope = undefined
  scope = undefined
  userId = 1

  beforeEach module('bookshelf.constant')
  beforeEach module('bookshelf.services')
  beforeEach module('bookshelf.controllers')

  beforeEach inject (_$httpBackend_, _$rootScope_, _$location_, $controller, hostName) ->
    $httpBackend = _$httpBackend_
    $location = _$location_
    $rootScope = _$rootScope_

    $httpBackend.expectGET hostName + "/users/#{userId}.json"
      .respond
        id: 1
        firstName: 'Nanashi'
        lastName: 'San'
        createdAt: '2014-12-31T23:59:59.239Z'
        memo: 'memo'

    scope = $rootScope.$new()
    $controller 'userCtrl',
      $scope: scope
      $routeParams:
        userId: userId

  it 'タイトル名が「ユーザー詳細」であること', ->
    expect(scope.title).toEqual('ユーザー詳細')

  it 'ユーザー情報が正しく読み込まれていること', ->
    $httpBackend.flush()
    expect(scope.user.id).toEqual(userId)
    expect(scope.user.firstName).toEqual('Nanashi')
    expect(scope.user.lastName).toEqual('San')
    expect(scope.user.createdAt).toEqual('2014-12-31T23:59:59.239Z')
    expect(scope.user.memo).toEqual('memo')

  it 'URLが正しいこと', ->
    $location.path "/user/#{userId}"
    $rootScope.$apply()
    expect($location.path()).toEqual("/user/#{userId}")

  it '編集画面へ遷移すること', ->
    scope.changeEdit()
    expect($location.path()).toEqual("/user/#{userId}/edit")
