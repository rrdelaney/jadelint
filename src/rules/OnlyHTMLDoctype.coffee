Rule = require './../Rule'

class OnlyHTMLDoctype extends Rule
    name: 'Only HTML doctypes are allowed'
    level: 'error'
    description: """
    `doctype` can only be set to `doctype html`
    """

    check: ->
        if @node.type is 'Doctype' and @node.val.toLowerCase() isnt 'html' then @fail()

module.exports = OnlyHTMLDoctype
