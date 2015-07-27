Rule = require './../Rule'

class DontUseHgroup extends Rule
    name: 'Dont use the hgroup tag'
    level: 'error'
    description: """
    Don't use an `hgroup` tag
    """

    check: ->
        if @node.type is 'Tag' and @node.name is 'hgroup' then @fail()

module.exports = DontUseHgroup
