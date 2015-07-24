Rule = require './../Rule'

class UseTypeForOl extends Rule
    name: 'Use a type attribute for ol tags'
    level: 'IGNORE'

    check: ->
        if @node.name is 'ol'
            for {name, val} in @node.attrs
                if name is 'type' then return

            @fail()

module.exports = UseTypeForOl
