BookShelf [![Build Status](https://travis-ci.org/to-sho-kan/bookshelf_proto.svg)](https://travis-ci.org/to-sho-kan/bookshelf_proto.svg?branch=master) [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/to-sho-kan/bookshelf_proto?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![PullReview stats](https://www.pullreview.com/github/to-sho-kan/bookshelf_proto/badges/add_user_books_api.svg?)](https://www.pullreview.com/github/to-sho-kan/bookshelf_proto/reviews/add_user_books_api)
=========


ローカルコミュニティ向け・書籍管理アプリのプロトタイプ

Feature
-------
* 書籍一覧機能
* 書籍貸借管理機能
* ユーザ管理機能

Demo
----

Installation
============
Install rails.

```
$ bundle install
```


Install gulp, bower, etc.

```
$ cd ngapp/
$ npm install -g gulp bower
$ npm install
$ bower install
```

Run application.

```
# in Rails root
$ rails s

# in ngapp/
$ cd ngapp/
$ gulp build
$ gulp
```


Document
========
See wiki & issues.

Ticket
======
[Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1226888)

Deploy
======
/publicにフロントエンド側のファイルを作成する
```
$ cd ngapp/
$ gulp prod
```

/publicのフロントエンド側のファイルを削除する
```
$ cd ngapp/
$ gulp clean
```

Test
====
```
$ cd ngapp/
$ npm install -g karma-cli

$ cd ngapp/test
$ karma start
```
