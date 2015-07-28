Rule = require './../Rule'

class UseTitleForAbbr extends Rule
    name: 'Use a title attribute on abbr elements'
    level: 'warning'
    description: """
    Use a `title` attribute for `abbr` tags

    ```jade
    //- Valid
    abbr(title='War and Peace') WaP
    abbr(title="Of Mice and Men") OMaM

    //- Invalid
    abbr OMaM
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'abbr'
            for {name, val} in @node.attrs
                if name is 'title' then return

            @fail()

module.exports = UseTitleForAbbr
