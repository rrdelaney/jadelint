Rule = require './../Rule'

class OnlyHTMLDoctype extends Rule
    name: 'Only HTML doctypes are allowed'
    level: 'error'

    check: ->
        if @node.type is 'Doctype' and @node.val isnt 'html' then @fail()

module.exports = OnlyHTMLDoctype
