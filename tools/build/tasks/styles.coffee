gulp = require 'gulp'
stylus = require 'gulp-stylus'

sourcemaps = require 'gulp-sourcemaps'

concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
wiredep = require('wiredep').stream

parameters = require '../parameters.coffee'

gulp.task 'styles', ->
  gulp.src "#{parameters.paths.src.main}/main.styl"
  .pipe plumber()
  .pipe sourcemaps.init()
  .pipe stylus()
  .pipe concat parameters.files.styles
  .pipe sourcemaps.write()
  .pipe gulp.dest parameters.paths.www.styles
