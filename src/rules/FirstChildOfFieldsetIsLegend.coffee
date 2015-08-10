Rule = require './../Rule'

class FirstChildOfFieldsetIsLegend extends Rule
    name: 'Only use the figcaption tag at start or end of figure'
    level: 'warning'
    description: """
    Only use the `figcaption` tag at the beginning or end of a `figure` tag

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
