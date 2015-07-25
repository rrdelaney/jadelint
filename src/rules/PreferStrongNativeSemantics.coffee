Rule = require './../Rule'

class PreferStrongNativeSemantics extends Rule
    name: 'Prefer strong native semantics'
    level: 'ignore'
    description: """
    Don't use `role=".."` on `nav`, `hr`, or `br`
    """

    check: ->
        if @node.name in ['nav', 'hr', 'br']
            for {name, val} in @node.attrs
                if name is 'role' then @fail()

module.exports = PreferStrongNativeSemantics
