Rule = require './../Rule'

class NoTagWhitespace extends Rule
    name: 'No Whitespace is allowed around attribute values'
    level: 'warning'

    check: ->
        for {name, val} in @node.attrs ? []
            rawVal = @clean val
            if rawVal isnt rawVal.trim() then @fail()

module.exports = NoTagWhitespace
