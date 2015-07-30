Rule = require './../Rule'

class AddValueToSubmit extends Rule
    name: 'Add value attribute to submit types'
    level: 'warning'
    description: """
    Add value attribute to `input(type='submit')`

    ```jade
    //- Valid
    input(type="submit" value="Search")

    //- Invalid
    input(type="submit")
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'input'
            isSubmit = hasValue = false
            for {name, val} in @node.attrs
                if name is 'type' and @clean(val) is 'submit' then isSubmit = true
                if name is 'value' then hasValue = true

            if isSubmit and not hasValue then @fail()

module.exports = AddValueToSubmit
