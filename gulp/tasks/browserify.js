var watchify = require('watchify');
var gulp = require('gulp');
var source = require('vinyl-source-stream');
var livereload = require('gulp-livereload');
var handleErrors = require('../util/handleErrors');

module.exports = function() {

  var w = watchify({
    entries: ['./src/javascript/index.coffee'],
    extensions: ['.coffee', '.jsx'],
  })
  .transform('reactify');

  w.on('update', function() {
    console.log('we got changes.....')
    w.bundle()
      .on('error', handleErrors)
      .pipe(source('index.js'))
      .pipe(gulp.dest('./build/'))
      .pipe(livereload());
  })
  .on('error', handleErrors)
  .on('log', console.log.bind(console));

  w.bundle();
};