Rule = require './../Rule'

class DontUseHgroup extends Rule
    name: 'Dont use the hgroup tag'
    level: 'error'

    check: ->
        if @node.name is 'hgroup' then @fail()

module.exports = DontUseHgroup
