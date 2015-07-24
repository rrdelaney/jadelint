Rule = require './../Rule'

class HTMLRootRequiresLang extends Rule
    name: 'HTML root requires a lang attribute'
    level: 'error'

    check: ->
        if @node.name is 'html'
            for {name, val} in @node.attrs
                if name is 'lang' then return

            @fail()

module.exports = HTMLRootRequiresLang
