Rule = require './../Rule'

class NoXMLTagNamespace extends Rule
    name: 'No xmlns attribute allowed'
    level: 'warning'
    description: """
    A tag cannot have an `xmlns` attribute
    """

    check: ->
        for {name, val} in @node.attrs ? []
            if name is 'xmlns' then @fail()

module.exports = NoXMLTagNamespace
