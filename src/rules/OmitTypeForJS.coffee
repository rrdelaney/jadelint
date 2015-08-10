Rule = require './../Rule'

class OmitTypeForJS extends Rule
    name: 'Omit type attribute for JS scripts'
    level: 'warning'
    description: """
    Don't do `script(type='text/javascript')`
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'script'
            for {name, val} in @node.attrs
                if name is 'type' and @clean(val) is 'text/javascript' then @fail()

module.exports = OmitTypeForJS
