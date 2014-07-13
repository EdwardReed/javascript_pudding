# @cjsx React.DOM
dispatcher = require('../lib/dispatcher')
Menu       = require('./menu.cjsx')


RouterComponent = React.createClass
  render: ->
    mainArea = switch Backbone.history.fragment
      when '' then <h3>Home</h3>
      when 'item' then <h3>Item</h3>

    <div>
      <Menu activeLink={@props.activeLink} />
      {mainArea}
    </div>


module.exports = RouterComponent

