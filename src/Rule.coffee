class Rule
    name = 'Generic Rule'
    filename = 'Generic Filename'
    lineNumber = 'Generic LineNo'
    level = 'ignore'

    constructor: (@filename, @node) ->

    check: (node) ->
        false

    fail: ->
        err = new Error()
        err.level = @level
        err.name = @name
        err.filename = @filename
        err.line = @node.line
        throw err

    clean: (str) ->
        str.replace /^'/g, ''
           .replace /'$/g, ''
           .replace /^"/g, ''
           .replace /"$/g, ''

module.exports = Rule
