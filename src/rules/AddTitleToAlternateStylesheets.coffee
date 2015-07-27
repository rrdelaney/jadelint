Rule = require './../Rule'

class AddTitleToAlternateStylesheets extends Rule
    name: 'Add title to alternate stylesheet'
    level: 'warning'
    description: """
    Use a `title` attribute on alternate stylesheets

    ```jade
    //- Valid
    link(href='my.css' rel='alternate stylesheet' title='Altsheet')

    //- Invalid
    link(href='my.css' rel='alternate stylesheet')
    ```
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'link'
            isAlternateStylesheet = false
            hasTitle = false

            for {name, val} in @node.attrs
                if name is 'rel' and @clean(val) is 'alternate stylesheet' then isAlternateStylesheet = true
                if name is 'title' then hasTitle = true

            if isAlternateStylesheet and not hasTitle then @fail()

module.exports = AddTitleToAlternateStylesheets
