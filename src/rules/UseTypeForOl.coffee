Rule = require './../Rule'

class UseTypeForOl extends Rule
    name: 'Use a type attribute for ol tags'
    level: 'ignore'
    description: """
    Use a `type` attribute for `ol` tags

    ```jade
    //- Valid
    ol(type='I')
      li thing
      li other

    //- Invalid
    ol
      li thing
      li other
    ```
    """

    check: ->
        if @node.name is 'ol'
            for {name, val} in @node.attrs
                if name is 'type' then return

            @fail()

module.exports = UseTypeForOl
