# Karma configuration
# Generated on Sat Jan 17 2015 13:47:42 GMT+0900 (JST)

module.exports = (config) ->
  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    # filesやexcludeを指定する際のベースとなるディレクトリのパスを指定します
    basePath: '../'

    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    # 利用するテストフレームワークを指定します
    frameworks: ['jasmine']

    # list of files / patterns to load in the browser
    # テストに利用するファイルを指定します
    files: [
      'app/vendor/angular.js'
      'app/vendor/angular-*.js'
      'app/coffee/module.coffee'
      'app/coffee/constant/*.coffee'
      'app/coffee/services/*.coffee'
      'app/coffee/controllers/*.coffee'
#      'app/coffee/filters/*.coffee'
#      'app/coffee/directives/*.coffee'
#      'app/coffee/**/*.coffee'
#      'app/coffee/main.coffee'
#      'app/coffee/config.coffee'
      'test/**/*.coffee'
    ]

    # list of files to exclude
    # 上記のfilesで指定したファイルのうち、不要なものを指定します
    exclude: [
    ]

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    # CofeeScriptで記述したテストコードをJavaScripsにコンパイルする用途などに利用します
    preprocessors: {
      'app/coffee/**/*.coffee': 'coffee'
      'test/**/*.coffee': 'coffee'
#      'app/coffee/**/*.coffee': 'coverage'
    }

    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    # テストの実行状況を通知する方法を指定します
    reporters: [
      'progress'
#      'coverage'
    ]

    # web server port
    # karmaを起動するWebサーバのポート番号を指定します
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    # trueに設定すると、テストの実行状況やログの出力に色が付きます
    colors: true

    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    # 出力するログのレベルを指定します
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    # trueに設定すると、filesで指定したファイルに変更があった際に自動的にテストを再実行します
    # autoWatchを有効にするには、singleRunをfalseに設定する必要があります
    autoWatch: true

    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    # テストに利用するブラウザを指定します
    browsers: ['Chrome']

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    # trueに設定するとテストを１回実行した後に終了します
    singleRun: false
