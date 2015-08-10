Rule = require './../Rule'

class FirstChildOfFieldsetIsLegend extends Rule
    name: 'Only use the legent tag at start of a fieldset'
    level: 'ignore'
    description: """
    Only use the `legend` tag at the beginning of a `fieldset` tag

    ```jade
    //- Valid
    fieldset
      legend about
      p Some text

    //- Invalid
        fieldset
          p Some text
          legend about
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'fieldset'
            subnodes = @node.block?.nodes ? []
            for subnode, index in subnodes
                if subnode.name is 'legend' and index isnt 0 then @fail()

module.exports = FirstChildOfFieldsetIsLegend
