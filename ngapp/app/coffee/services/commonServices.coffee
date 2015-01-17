service = angular.module 'bookshelf.services'

###
# 共有オブジェクト
###
service.service 'sharedStateService', [
  () ->
    type: ''
    userId: ''
]
