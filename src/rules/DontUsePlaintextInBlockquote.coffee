Rule = require './../Rule'

class DontUsePlaintextInBlockquote extends Rule
    name: 'Dont use plaintext in a blockquote tag'
    level: 'IGNORE'

    check: ->
        if @node.name is 'blockquote'
            subnodes = @node.block?.nodes ? []
            firstChild = subnodes[0] ? {}

            if firstChild.type is 'Text' then @fail()

module.exports = DontUsePlaintextInBlockquote
