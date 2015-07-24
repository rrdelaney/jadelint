Rule = require './../Rule'

class OmitTypeForCSS extends Rule
    name: 'Omit type attribute for CSS styles'
    level: 'warning'

    check: ->
        if @node.name is 'style'
            for {name, val} in @node.attrs
                if name is 'type' and @clean(val) is 'text/css' then @fail()

module.exports = OmitTypeForCSS
