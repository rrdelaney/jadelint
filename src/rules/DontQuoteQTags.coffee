Rule = require './../Rule'

class DontQuoteQTags extends Rule
    name: 'Dont use quotes in a q tag'
    level: 'warning'
    description: """
    Dont use quotes in a `q` tag

    ```jade
    //- Valid
    q This is a quote

    //- Invalid
    q "This is a quote"
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'q'
            subnodes = @node.block?.nodes ? []
            firstChild = subnodes[0] ? {}

            if firstChild.type is 'Text'
                if firstChild.val.trim().indexOf('"') is 0 and firstChild.val.trim().lastIndexOf('"') is firstChild.val.trim().length - 1
                    @fail()


module.exports = DontQuoteQTags
