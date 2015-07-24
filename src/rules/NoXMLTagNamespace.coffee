Rule = require './../Rule'

class NoXMLTagNamespace extends Rule
    name: 'No xmlns attribute allowed'
    level: 'WARNING'

    check: ->
        for {name, val} in @node.attrs ? []
            if name is 'xmlns' then @fail()

module.exports = NoXMLTagNamespace
