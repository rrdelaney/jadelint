Rule = require './../Rule'

class DontLinkToFavicon extends Rule
    name: 'Dont link to favicon.ico'
    level: 'warning'
    description: """
    Don't like directly to `favicon.ico`

    ```jade
    //- Valid
    link(rel='icon' href='favicon96x96.png')
    link(rel='icon' href='favicon96x96.ico')

    //- Invalid
    link(rel='icon' href='favicon.ico')
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'link'
            for {name, val} in @node.attrs
                if name is 'href' and val.match /favicon.ico/g then @fail()

module.exports = DontLinkToFavicon
