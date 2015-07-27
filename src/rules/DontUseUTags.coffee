Rule = require './../Rule'

class DontUseUTags extends Rule
    name: 'Dont Use u Tags'
    level: 'warning'
    description: """
    Don't use u tags

    ```jade
    //- Invalid
    u Some text
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'u' then @fail()

module.exports = DontUseUTags
