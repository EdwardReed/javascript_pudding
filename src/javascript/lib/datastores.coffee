dispatcher = require('./dispatcher')

# Initialize the data object privately
_data = {}

# Get an array of ajax calls to the data routes
dataRoutes = [
  'route1',
  'route2',
]

ajaxCallsForData = _.map dataRoutes, (route) -> $.ajax("/api/#{route}")



Datastore =

  getAll: ->
    _data

  fetch: ->
    _data = {}
    req = $.when.apply($, ajaxCallsForData)

    # This list has to be in the same order as the dataRoutes array. This is clunky
    req.done (
      route1,
      route2,
      ) ->

      # If there is an ajax error, throw an error
      _.each _.toArray(arguments), (result) ->
        if result[1] isnt 'success' then throw new Error('ajax error: ', result)


      # trigger the fetched event, set the data and send the data
      _data = _.extend(
        {}
        {route1: route1[0]}
        {route2: route2[0]}
      )
      dispatcher.trigger('fetched')


module.exports = Datastore












