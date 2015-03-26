window.Backbone = require('backbone')
window.$        = window.jQuery = require('jquery')
Backbone.$      = require('jquery')
Backbone._      = require('lodash')
window._        = require('./vendor/underscore_mixins')
window.React    = require('react/addons')
require('bootstrap')

dispatcher      = require('./lib/dispatcher')
datastores      = require('./lib/datastores')
RouterComponent = require('./components/router.cjsx')


# According to Ben Alpert: React.renderComponent will update an existing
# component if there is one. http://stackoverflow.com/a/19837165
class AppRouter extends Backbone.Router

  # TODO: I could generate this directly from menu_items.coffee
  routes:
    '': -> @mountApp('')
    'item': -> @mountApp('item')


  mountApp: (route) ->
    React.renderComponent(new RouterComponent({data: datastores.getAll(), activeLink: route}), document.getElementById('frame'))


window.appRouter = new AppRouter()
Backbone.history.start()

