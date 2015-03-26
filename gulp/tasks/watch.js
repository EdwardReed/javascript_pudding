var gulp       = require('gulp');
var livereload = require('gulp-livereload');

module.exports = function(){
	gulp.watch('src/javascript/**/*', ['browserify']);
	gulp.watch('src/less/**', ['less']);
	gulp.watch('src/images/**', ['images']);
	livereload();
};
