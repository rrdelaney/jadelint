Rule = require './../Rule'

class AddTitleToInputWithPattern extends Rule
    name: 'Add title attibute to input element when there is pattern attribute'
    level: 'warning'
    description: """
    When an `input` element has a `pattern` attribute include a `title`
    attribute.

    ```jade
    //- Valid
    input(pattern='[0-9]{3}' title='PIN Number')

    //- Invalid
    input(pattern='[0-9]{3}')
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'input'
            hasPattern = hasValue = false
            for {name, val} in @node.attrs
                if name is 'title' then hasTitle = true
                if name is 'pattern' then hasPattern = true

            if hasPattern and not hasTitle then @fail()

module.exports = AddTitleToInputWithPattern
