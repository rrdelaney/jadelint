Rule = require './../Rule'

class NoTagWhitespace extends Rule
    name: 'No Whitespace is allowed around attribute values'
    level: 'WARNING'

    check: ->
        for {name, val} in @node.attrs ? []
            rawVal = val.replace(/^'/g, '').replace(/'$/g, '')
            if rawVal isnt rawVal.trim() then @fail()

module.exports = NoTagWhitespace
