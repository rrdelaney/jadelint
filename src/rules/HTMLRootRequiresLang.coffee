Rule = require './../Rule'

class HTMLRootRequiresLang extends Rule
    name: 'HTML root requires a lang attribute'
    level: 'error'
    description: """
    The root `html` element must have a `lang` attribute

    ```jade
    //- Valid
    html(lang='en-US')
    html(lang='jp')

    //- Invalid
    html
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'html'
            for {name, val} in @node.attrs
                if name is 'lang' then return

            @fail()

module.exports = HTMLRootRequiresLang
