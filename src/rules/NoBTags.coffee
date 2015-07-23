Rule = require './../Rule'

class NoBTags extends Rule
    level: @IGNORE

    check: (node) ->
        true

module.exports = NoBTags
