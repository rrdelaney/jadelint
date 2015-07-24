Rule = require './../Rule'

class DontUseLegacyEncoding extends Rule
    name: 'Dont use legacy encoding format'
    level: 'FAILURE'

    check: ->
        if @node.type is 'meta'
            for {name, val} in @node.attrs
                if name is 'http-equiv' and @clean(val) is 'Content-Type' then @fail()

module.exports = DontUseLegacyEncoding
