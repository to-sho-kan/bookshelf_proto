COFFEE_FILES = 'app/coffee/**/*.coffee'
SASS_FILES = 'app/sass/**/*.scss'
SCRIPT_FILES = 'dist/scripts/**/*.js'
CSS_FILES = 'dist/css/**/*.scss'
VIEW_FILES = 'app/views/**/*.html'
DEV_SCRIPT_PATH = 'app/scripts'
DEV_CSS_PATH = 'app/styles'
DEV_PATH = 'app'
PROD_PATH = '../public'

gulp = require 'gulp'
coffee = require 'gulp-coffee'
sass = require 'gulp-sass'
webserver = require 'gulp-webserver'
plumber = require 'gulp-plumber'
uglify = require 'gulp-uglify'
minifyCSS = require 'gulp-minify-css'
usemin = require 'gulp-usemin'
concat = require 'gulp-concat'
mainBowerFiles = require 'main-bower-files'
del = require 'del'

# coffeeのコンパイル
gulp.task 'compile-coffee', ->
	gulp.src COFFEE_FILES
		.pipe plumber()
		.pipe coffee()
		.pipe gulp.dest DEV_PATH + '/scripts'

# sassのコンパイル
gulp.task 'compile-sass', ->
	gulp.src SASS_FILES
		.pipe plumber()
		.pipe sass()
		.pipe gulp.dest DEV_PATH + '/styles'

# htmlの変更感知
gulp.task 'watch-html', ->
	gulp.watch ['app/index.html'], ['copy-index']
	gulp.watch [VIEW_FILES], ['copy-view']

# coffeeの自動コンパイル(開発用)
gulp.task 'watch-coffee', ->
	gulp.watch [COFFEE_FILES], ['compile-coffee']

# sassの自動コンパイル(開発用)
gulp.task 'watch-sass', ->
	gulp.watch [SASS_FILES], ['compile-sass']

# webserverの起動
gulp.task 'webserver', ->
	gulp.src DEV_PATH
		.pipe webserver
			livereload:
				enable: true
				filter: (filename) ->
					not filename.match /\.(scss|coffee)$/
			open: false

# 開発用js/css削除
gulp.task 'clean-dev', ->
	del.sync DEV_PATH + 'scripts'
	del.sync DEV_PATH + 'styles'

# 開発用タスク
gulp.task 'build', [
	'clean-dev'
	'compile-coffee'
	'compile-sass'
], ->
	gulp.src mainBowerFiles
		paths:
			bowerDirectory: 'bower_components'
			bowerJson: 'bower.json'
	.pipe gulp.dest DEV_PATH + '/bower_components'

# デプロイ用ディレクトリ削除
gulp.task 'clean', ->
	del.sync PROD_PATH + '/index.html',
		force: true
	del.sync PROD_PATH + '/views',
		force: true
	del.sync PROD_PATH + '/scripts',
		force: true
	del.sync PROD_PATH + '/styles',
		force: true
	del.sync PROD_PATH + '/bower_components',
		force: true

# デプロイ用タスク
gulp.task 'prod', ['clean', 'build'], ->
	gulp.src mainBowerFiles
		paths:
			bowerDirectory: 'bower_components'
			bowerJson: 'bower.json'
	.pipe gulp.dest PROD_PATH + '/bower_components'

	gulp.src VIEW_FILES
		.pipe gulp.dest PROD_PATH + '/views'

	gulp.src SCRIPT_FILES
		.pipe uglify()
		.pipe gulp.dest PROD_PATH + '/scripts'

	gulp.src CSS_FILES
		.pipe concat 'css.min.css'
		.pipe minifyCSS()
		.pipe gulp.dest PROD_PATH + '/styles'

	gulp.src 'app/index.html'
		.pipe usemin
			js: [uglify()]
			css: [minifyCSS(), 'concat']
		.pipe gulp.dest PROD_PATH

# デフォルトタスク
gulp.task 'default', [
	'watch-html'
	'watch-coffee'
	'watch-sass'
	'webserver'
]
