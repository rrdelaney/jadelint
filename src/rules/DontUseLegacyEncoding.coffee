Rule = require './../Rule'

class DontUseLegacyEncoding extends Rule
    name: 'Dont use legacy encoding format'
    level: 'error'
    description: """
    Don't use the
    `<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">`
    syntax for specifying charset
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'meta'
            for {name, val} in @node.attrs
                if name is 'http-equiv' and @clean(val) is 'Content-Type' then @fail()

module.exports = DontUseLegacyEncoding
