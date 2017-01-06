# Modules
gulp       = require 'gulp'
watchify   = require 'gulp-watchify'
plumber    = require 'gulp-plumber'
rename     = require 'gulp-rename'
sourcemaps = require 'gulp-sourcemaps'
uglify     = require 'gulp-uglify'
util       = require 'gulp-util'
formatter  = require 'pretty-hrtime'
buffer     = require 'vinyl-buffer'
util       = require 'gulp-util'

sass       = require 'gulp-sass'
autoprefixer   = require 'gulp-autoprefixer'

# PATH
jsSrcPath  = "src/script"
jsEntry  = "index.jsx"
sassSrcPath  = "src/style"
StaticPath = "build"
jsDestPath = StaticPath+"/script"
cssDestPath = StaticPath+"/style"



gulp.task 'watchify', watchify (watchify)->
  time = process.hrtime()
  return gulp.src([jsSrcPath+'/'+jsEntry])
    .pipe(plumber())
    .pipe(watchify(
      watch: true
      basedir: './'
      debug : true
      transform: [ 'babelify' ]
    ))
    .pipe(buffer())
    .pipe(sourcemaps.init(
      loadMaps: true
    ))
    #.pipe uglify()
    .pipe rename('bundle.js')
    .pipe sourcemaps.write './'
    .pipe gulp.dest jsDestPath
    .on 'end',->
      util.log 'Bundled', util.colors.green 'bundle.js','in',util.colors.magenta formatter(process.hrtime time)

gulp.task 'sass', ->
  return gulp.src sassSrcPath+'/**/*.sass'
    .pipe plumber
      errorHandler: (err)->
        util.log 'Sass',util.colors.red err.messageFormatted
        this.emit 'end'
    .pipe sass
      includePaths: [
        './node_modules/compass-mixins/lib'
      ]
      sourceMap: true
      sourceMapContents: 'sass'
      #outputStyle:'compressed'
    .pipe autoprefixer()
    .pipe gulp.dest cssDestPath

gulp.task 'watch', ['sass', 'watchify'], ->
  gulp.watch sassSrcPath+'/**/*.sass', ['sass']


