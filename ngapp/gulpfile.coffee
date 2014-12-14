###
TODO: 現状、初回起動時にlivereloadが２回走ってしまう...	
###

gulp = require 'gulp'
coffee = require 'gulp-coffee'
sass = require 'gulp-sass'
webserver = require 'gulp-webserver'
plumber = require 'gulp-plumber'

# coffeeのコンパイル
gulp.task 'compile-coffee', ->
	gulp.src 'app/coffee/**/*.coffee'
		.pipe plumber()
		.pipe coffee()
		.pipe gulp.dest 'app/scripts'

# sassのコンパイル
gulp.task 'compile-sass', ->
	gulp.src 'app/sass/**/*.scss'
		.pipe plumber()
		.pipe sass()
		.pipe gulp.dest 'app/styles'

# coffeeの自動コンパイル
gulp.task 'watch-coffee', ->
	gulp.watch ['./app/coffee/**/*.coffee'], ['compile-coffee']

# sassの自動コンパイル
gulp.task 'watch-sass', ->
	gulp.watch ['./app/sass/**/*.scss'], ['compile-sass']

# webserverの起動
gulp.task 'webserver', ->
	gulp.src 'app'
		.pipe webserver
			livereload:
				enable: true
				filter: (filename) ->
					not filename.match /\.(scss|coffee)$/
			open: true

# デフォルトタスク
gulp.task 'default', [
	'compile-coffee'
	'compile-sass'
	'watch-coffee'
	'watch-sass'
	'webserver'
]
