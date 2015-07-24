Rule = require './../Rule'

class DontUseHgroup extends Rule
    name: 'Dont use the hgroup tag'
    level: 'FAILURE'

    check: ->
        if @node.name is 'hgroup' then @fail()

module.exports = DontUseHgroup
