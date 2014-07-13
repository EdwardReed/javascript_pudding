# @cjsx React.DOM
menuItemHash   = require('../lib/menu_items.coffee')
helpText       = require('../lib/help.coffee')

OverlayTrigger = require('react-bootstrap').OverlayTrigger
Popover        = require('react-bootstrap').Popover



MenuItem = React.createClass
  render: ->
    active =
      if (@props.data.link is @props.activeLink) or (@props.data.link is '#'+@props.activeLink)
      then 'active'
      else ''
    <li className={active}>
      <a href={@props.data.link}>
        {@props.data.text}
      </a>
    </li>


Menu = React.createClass



  render: ->
    helpPopover = <Popover><div dangerouslySetInnerHTML={{__html: helpText }} /></Popover>

    menuItems = _.map menuItemHash, (menuItem) =>
      <MenuItem data={menuItem} activeLink={@props.activeLink} />

    <nav className="navbar navbar-default" role="navigation">
      <div className="container-fluid">
        <div className="navbar-header">
          <a className="navbar-brand" href="#">Starter Kit</a>
        </div>
        <div className="collapse navbar-collapse">

          <ul className="nav navbar-nav">
            {menuItems}
          </ul>

          <ul className="nav navbar-nav navbar-right">
            <li>
              <OverlayTrigger trigger="click" placement="bottom" overlay={helpPopover}>
                <a href="#">Help</a>
              </OverlayTrigger>
            </li>
            <li className="dropdown">
              <a href="#" className="dropdown-toggle" data-toggle="dropdown">Dropdown
                <b className="caret"></b>
              </a>
              <ul className="dropdown-menu">
                <li><a href="#">Logout</a></li>
              </ul>
            </li>
          </ul>

        </div>
      </div>
    </nav>

module.exports = Menu