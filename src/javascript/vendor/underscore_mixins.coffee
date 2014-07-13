_     = require('lodash')
_.str = require('underscore.string')

_.mixin(_.str.exports())
_.str.include('Underscore.string', 'string')


undefinedDate = new Date(1999,1,1);
undefinedNumber = -9999;
undefinedString = 'undefinedString';


# clearly these things need some tests
# They can also be made clearer like in the isLegitValue example
_.mixin


  # _.isLegitNumber():
  # 0: true
  # '': false
  # null: false
  # 'null': false
  # Infinity: false
  # undefined: false
  # undefinedNumber: false  // make sure undefinedNumber is defined
  isLegitNumber: (val) ->
    return false  if val is undefinedNumber
    val = parseInt(val, 10)
    (if _.isNaN(val) then false else true)


  # _.isLegitString():
  # 'hi': true
  # '': false
  # null: false
  # 'null': false
  # 'NULL': false
  # undefined: false
  # 'undefined': false
  # 'undefinedString': false
  isLegitString: (val) ->
    val = _.trim(val)
    return false unless val
    return false if val is "undefined"
    return false if val is undefinedString
    return false if isNaN(val)
    if val is "null" or val is "NULL"
      false
    else
      true


  # going to have to bring back _.trim() for the analytics version. It turns everything into strings
  # This is working at the moment, creating red rows on bad values
  # Order matters here. Need to write tests
  isLegitValue: (val) ->
    return true if _.isBoolean(val)
    return true if _.isString(val) and not _.isNaN(val)
    return true if val is 0
    return false if not val
    return false if val is "undefined"
    return false if val is undefinedString
    return false if val is "null" or val is "NULL"
    return false if isNaN(val)
    return false if not _.isFinite(val)
    return true



module.exports = _