Rule = require './../Rule'

class UseUTF8 extends Rule
    name: 'Only use UTF-8 as charset'
    level: 'error'

    check: ->
        if @node.name is 'meta'
            for {name, val} in @node.attrs
                if name is 'charset' and @clean(val) isnt 'UTF-8' then @fail()

module.exports = UseUTF8
