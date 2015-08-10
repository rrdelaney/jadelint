Rule = require './../Rule'

class AddDeferForAsyncScripts extends Rule
    name: 'Add defer for async JS scripts'
    level: 'warning'
    description: """
    Use `defer` attributes on scripts with the `async` attribute

    ```jade
    //- Valid
    script(async defer src='script.js')

    //- Invalid
    script(async src='script.js')
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'script'
            hasDefer = hasAsync = false
            for {name, val} in @node.attrs
                if name is 'defer' then hasDefer = true
                if name is 'async' then hasAsync = true

            if hasAsync and not hasDefer then @fail()

module.exports = AddDeferForAsyncScripts
