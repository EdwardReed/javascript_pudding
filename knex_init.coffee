_ = require("lodash")

# Setup knex instance and db connection. Move this into a module
module.exports = require("knex").initialize(
  client: "mysql"
  connection:
    host: ""
    user: ""
    password: ""
    database: ""
    charset: "utf8"
    # socketPath: "/Applications/MAMP/tmp/mysql/mysql.sock"

  pool:
    min: 0 # minimum number of connections it keeps around
    idleTimeoutMillis: 1000 # close connection after 1 second
)
console.log "setting up knex"