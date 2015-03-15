<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/687403/6655215/b75e9dd0-cab1-11e4-9281-8dcfe095d56b.jpg" alt="Javascript Pudding"/>
</p>
<h1>
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
Javascript Pudding - Express + Backbone ~~~~~~~~~~~~~~~ + React + Bootstrap ~~~~~~~~~~~~~~~~~~~~
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
</h1>
React Starter Kit
=================
A starter repo that includes Browserify with Gulp, React, Express, Knex, Bootstrap and Coffeescript (including cjsx)

Complete List
* React + Coffee-react
* Gulp & Browserify
* Central datastore with event system
* Backbone router & dispatcher
* Express
* Knex SQL ORM (http://knexjs.org)
* LESS
* Bootstrap
* React-bootstrap components: (http://react-bootstrap.github.io/components.html)
* underscore.string, lodash, already setup for your own mixins
* Bluebird for promises
* Deploy shell scrips for staging and production


Write coffeescript in your react components! It's so clean. Check it out: (https://github.com/jsdf/coffee-react)
The central datastore is somewhat along the lines of Flux. This does not use Backbone models and collections, but Backbone is included if you want that.
http://facebook.github.io/react/docs/flux-overview.html


to start,

```
npm install
```

In one terminal tab, type:
```
gulp
```
This runs the browserify/reactify/coffee transforms for the client.

In another terminal tab, type:
```
npm start
```
This runs the Express server on port 3000

Then fire up

```
http://localhost:3000/#
```


Open to pull requests!
