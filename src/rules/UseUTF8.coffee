Rule = require './../Rule'

class UseUTF8 extends Rule
    name: 'Only use UTF-8 as charset'
    level: 'error'
    description: """
    Only use `UTF-8` as the `charset`

    ```jade
    //- Valid
    meta(charset='UTF-8')

    //- Invalid
    meta(charset='UFT8')
    meta(charset='OtherSet')
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'meta'
            for {name, val} in @node.attrs
                if name is 'charset' and @clean(val) isnt 'UTF-8' then @fail()

module.exports = UseUTF8
