Rule = require './../Rule'

class DontUseSTags extends Rule
    name: 'Dont Use s Tags'
    level: 'warning'
    description: """
    Don't use s tags

    ```jade
    //- Invalid
    s Some text
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 's' then @fail()

module.exports = DontUseSTags
