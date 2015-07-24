Rule = require './../Rule'

class PreferStrongNativeSemantics extends Rule
    name: 'Prefer strong native semantics'
    level: 'IGNORE'

    check: ->
        if @node.type is 'Tag' and @node.name in ['nav', 'hr', 'br']
            for {name, val} in @node.attrs
                if name is 'role' then @fail()

module.exports = PreferStrongNativeSemantics
