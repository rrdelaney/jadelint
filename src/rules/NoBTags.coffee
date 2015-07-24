Rule = require './../Rule'

class NoBTags extends Rule
    level: 'FAILURE'
    name: 'No <b> tags allowed'

    check: ->
        if @node.type is 'Tag' and @node.name is 'b' then @fail()

module.exports = NoBTags
