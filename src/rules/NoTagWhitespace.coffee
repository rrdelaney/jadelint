Rule = require './../Rule'

class NoTagWhitespace extends Rule
    name: 'No Whitespace is allowed around attribute values'
    level: 'warning'
    description: """
    Attribute tags cannot contain edge whitespace

    ```jade
    //- Valid
    div(id='id')

    //- Invalid
    div(id='  id')
    div(id='id  ')
    div(id='  id  ')
    div(id=" id")
    ```
    """

    check: ->
        for {name, val} in @node.attrs ? []
            rawVal = @clean val
            if rawVal isnt rawVal.trim() then @fail()

module.exports = NoTagWhitespace
