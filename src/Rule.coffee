lex = require 'jade-lexer'
parse = require 'jade-parser'
LintError = require './LintError'

class Rule
    name = 'Generic Rule'
    filename = 'Generic Filename'
    lineNumber = 'Generic LineNo'
    level = 'ignore'

    constructor: (@filename, @node) ->

    check: ->
        false

    fail: ->
        err = new LintError()
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

    validate: (nodeContent) ->
        @node = (parse lex nodeContent).nodes[0]
        @check()

module.exports = Rule
