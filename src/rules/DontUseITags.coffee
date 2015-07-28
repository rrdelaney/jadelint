Rule = require './../Rule'

class DontUseITags extends Rule
    name: 'Dont Use i Tags'
    level: 'ignore'
    description: """
    Don't use i tags

    ```jade
    //- Invalid
    i Some text
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'i' then @fail()

module.exports = DontUseITags
