var gulp = require('./gulp')([
	'browserify',
  'less',
	'open',
	'watch',
	'serve'
]);

gulp.task('build', ['browserify', 'less']);
gulp.task('default', ['build', 'watch']);
