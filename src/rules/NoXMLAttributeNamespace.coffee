Rule = require './../Rule'

class NoXMLAttributeNamespace extends Rule
    name: 'No namespacing of attributes attribute allowed'
    level: 'warning'

    check: ->
        for {name, val} in @node.attrs ? []
            if name.match /\w+:\w+/g then @fail()

module.exports = NoXMLAttributeNamespace
