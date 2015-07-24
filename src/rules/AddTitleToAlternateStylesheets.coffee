Rule = require './../Rule'

class AddTitleToAlternateStylesheets extends Rule
    name: 'Add title to alternate stylesheet'
    level: 'WARNING'

    check: ->
        if @node.name is 'link'
            isAlternateStylesheet = false
            hasTitle = false

            for {name, val} in @node.attrs
                if name is 'rel' and @clean(val) is 'alternate stylesheet' then isAlternateStylesheet = true
                if name is 'title' then hasTitle = true

            if isAlternateStylesheet and not hasTitle then @fail()

module.exports = AddTitleToAlternateStylesheets
