Rule = require './../Rule'

class AddMinAndMaxToMeter extends Rule
    name: 'Add min and max attributes to meter elements'
    level: 'warning'
    description: """
    All `meter` elements must also have `min` and `max` attributes

    ```jade
    //- Valid
    meter(value='50' max='100' min='0')

    //- Invalid
    meter(value='0.5')
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'meter'
            hasMax = hasMin = false
            for {name, val} in @node.attrs
                if name is 'max' then hasMax = true
                if name is 'min' then hasMin = true

            if not (hasMax and hasMin) then @fail()

module.exports = AddMinAndMaxToMeter
