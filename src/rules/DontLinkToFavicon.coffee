Rule = require './../Rule'

class DontLinkToFavicon extends Rule
    name: 'Dont link to favicon.ico'
    level: 'WARNING'

    check: ->
        if @node.name is 'link'
            for {name, val} in @node.attrs
                if name is 'href' and val.match /favicon.ico/g then @fail()

module.exports = DontLinkToFavicon
