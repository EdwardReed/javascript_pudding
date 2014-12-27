# @cjsx React.DOM
dispatcher  = require('../lib/dispatcher')
Menu        = require('./menu.cjsx')
Spreadsheet = require('./spreadsheet.cjsx')

RouterComponent = React.createClass
  render: ->
    mainArea = switch Backbone.history.fragment
      when '' then <Spreadsheet />
      when 'item'
        <div class="container">
          <input type="text" list="aformulas" />
          <datalist id="aformulas">
            <option value="HTML" />
            <option value="CSS" />
            <option value="JavaScript" />
            <option value="Java" />
            <option value="Ruby" />
            <option value="PHP" />
          </datalist>
        </div>

    <div>
      <Menu activeLink={@props.activeLink} />
      {mainArea}
    </div>


module.exports = RouterComponent

