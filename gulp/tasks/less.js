var gulp       = require('gulp');
var less       = require('gulp-less');
var livereload = require('gulp-livereload');
var notify     = require('gulp-notify');

module.exports = function() {
  return gulp.src('./src/less/*.less')
    .pipe(less())
    .on('error', notify.onError({
      message: "<%= error.message %>",
      title: "LESS Error"
    }))
    .pipe(gulp.dest('./build'))
    .pipe(livereload());
};
