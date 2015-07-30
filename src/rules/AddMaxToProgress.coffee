Rule = require './../Rule'

class AddMaxToProgress extends Rule
    name: 'Add max attribute to progress elements'
    level: 'warning'
    description: """
    All `progress` elements must also have a `max` attribute

    ```jade
    //- Valid
    progress(value='50' max='100')

    //- Invalid
    progress(value='0.5')
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'progress'
            for {name, val} in @node.attrs
                if name is 'max' then return

            @fail()

module.exports = AddMaxToProgress
