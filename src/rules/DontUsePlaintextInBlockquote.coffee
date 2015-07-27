Rule = require './../Rule'

class DontUsePlaintextInBlockquote extends Rule
    name: 'Dont use plaintext in a blockquote tag'
    level: 'ignore'
    description: """
    Don't use plaintext in a `blockquote` tag

    ```jade
    //- Valid
    blockquote: p This is a quote

    //- Invalid
    blockquote This is a quote
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'blockquote'
            subnodes = @node.block?.nodes ? []
            firstChild = subnodes[0] ? {}

            if firstChild.type is 'Text' then @fail()

module.exports = DontUsePlaintextInBlockquote
