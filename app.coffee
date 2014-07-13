express = require('express')
http    = require('http')
path    = require('path')
fs      = require('fs')
knex    = require("./knex_init")
_       = require('lodash')

app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname

# development only
app.use express.errorHandler() if "development" is app.get("env")
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use app.router
app.use express.static(path.join(__dirname, "build"))

# Load index.html
app.get "/", (req, res) ->
  res.sendfile('./index.html')


# Load calculator data when app loads
getTableData = (req, res) ->
  table = req.route.path.split('/')[2]
  knex(table).select("*").then (data) ->
    res.send(data)

tables = [
  'route1'
  'route2'
]

# Define routes based on tables array
_.each tables, (table) =>
  app.get("/api/#{table}", getTableData)



# Super-hackable user auth: just making sure the email is in the DB
app.post "/api/users", (req, res) ->
  console.log('email: ', req.body.email)
  knex('users')
    .where(email: req.body.email)
    .then( (data) ->
      if _.isEmpty(data)
        res.send(false)
      else
        d = data[0]
        d.comments = undefined
        console.log('user:', d)
        res.send(d)
    )




# Start server
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
