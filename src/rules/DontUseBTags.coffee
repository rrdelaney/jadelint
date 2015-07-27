Rule = require './../Rule'

class DontUseBTags extends Rule
    name: 'Dont Use b Tags'
    level: 'warning'
    description: """
    Don't use b tags

    ```jade
    //- Invalid
    b Some text
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'b' then @fail()

module.exports = DontUseBTags
