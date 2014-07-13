var gulp    = require("gulp");
var connect = require('connect');
var http    = require('http');
var express    = require('express');
var livereload = require('connect-livereload');
var config  = require('../config');

module.exports = function(){
	var app = connect()
		.use(connect.logger('dev'))
		.use(connect.static(config.root));
	http.createServer(app).listen(config.port);

};
