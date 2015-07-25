Rule = require './../Rule'

class UseFigCaptionAtStartOrEnd extends Rule
    name: 'Only use the figcaption tag at start or end of figure'
    level: 'warning'
    description: """
    Only use the `figcaption` tag at the beginning or end of a `figure` tag

    ```jade
    //- Valid
    figure
      img(src='/img/figure1.png' alt='Some Figure')
      figcaption Figure 1

    figure
        figcaption Figure 1
        img(src='/img/figure1.png' alt='Some Figure')

    //- Invalid
    figure
        img(src='/img/figure1.png' alt='Some Figure')
        figcaption Figure 1
        img(src='/img/figure1.png' alt='Some Figure')
    ```
    """

    check: ->
        if @node.name is 'figure'
            subnodes = @node.block?.nodes ? []
            for subnode, index in subnodes
                if subnode.name is 'figcaption' and index isnt 0 and index isnt subnodes.length - 1 then @fail()

module.exports = UseFigCaptionAtStartOrEnd
