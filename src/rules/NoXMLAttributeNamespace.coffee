Rule = require './../Rule'

class NoXMLAttributeNamespace extends Rule
    name: 'No namespacing of attributes attribute allowed'
    level: 'warning'
    description: """
    An attribute cannot be namespaced with `namespace:attribute`
    """

    check: ->
        for {name, val} in @node.attrs ? []
            if name.match(/\w+:\w+/g) and name.split(':')[0] isnt 'xlink' then @fail()

module.exports = NoXMLAttributeNamespace
