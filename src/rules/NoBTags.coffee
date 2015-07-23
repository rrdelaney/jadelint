Rule = require './../Rule'

class NoBTags extends Rule
    level: @IGNORE
    name: 'No <b> tags allowed'

    constructor: (@filename, @lineNumber) ->

    check: (node) ->
        if node.type is 'Tag' and node.name is 'b' then @fail()

module.exports = NoBTags
