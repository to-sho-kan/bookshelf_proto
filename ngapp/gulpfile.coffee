###
TODO: 現状、初回起動時にlivereloadが２回走ってしまう...	
###

COFFEE_FILES = 'app/coffee/**/*.coffee'
SASS_FILES = 'app/sass/**/*.scss'
DEV_SCRIPT_PATH = 'app/scripts'
DEV_CSS_PATH = 'app/styles'
DEPLOY_PATH = './dist'

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

# coffeeのコンパイル
gulp.task 'compile-coffee', ->
	gulp.src COFFEE_FILES
		.pipe plumber()
		.pipe coffee()
		.pipe gulp.dest 'app/scripts'

# sassのコンパイル
gulp.task 'compile-sass', ->
	gulp.src SASS_FILES
		.pipe plumber()
		.pipe sass()
		.pipe gulp.dest 'app/styles'

# coffeeの自動コンパイル(開発用)
gulp.task 'watch-coffee', ->
	gulp.watch [COFFEE_FILES], ['compile-coffee']

# sassの自動コンパイル(開発用)
gulp.task 'watch-sass', ->
	gulp.watch [SASS_FILES], ['compile-sass']

# webserverの起動
gulp.task 'webserver', ->
	gulp.src 'app'
		.pipe webserver
			livereload:
				enable: true
				filter: (filename) ->
					not filename.match /\.(scss|coffee)$/
			open: false

# デプロイ用タスク
gulp.task 'build', ->
	gulp.src 'app/index.html'
		.pipe usemin
			js: [uglify()]
			css: [minifyCSS(), 'concat']
		.pipe gulp.dest DEPLOY_PATH

	gulp.src mainBowerFiles
		paths:
			bowerDirectory: 'bower_components'
			bowerrc: '.bowerrc'
			bowerJson: 'bower.json'
	.pipe gulp.dest 'dist/bower_components'

	gulp.src COFFEE_FILES
		.pipe coffee()
		.pipe concat 'app.min.js'
		.pipe uglify()
		.pipe gulp.src 'dist/scripts'

	gulp.src SASS_FILES
		.pipe sass()
		.pipe concat 'css.min.css'
		.pipe minifyCSS()
		.pipe gulp.src 'dist/styles'

# デフォルトタスク
gulp.task 'default', [
	'compile-coffee'
	'compile-sass'
	'watch-coffee'
	'watch-sass'
	'webserver'
]
