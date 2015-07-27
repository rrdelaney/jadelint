lex = require 'jade-lexer'
parse = require 'jade-parser'
LintError = require './LintError'

# The general rule class from which other inherit
#
# @abstract
class Rule
    # @property [String] the name of the rule
    name = 'Generic Rule'

    # @property [String] filename currently being linted
    filename = 'Generic Filename'

    # @property [Number] lineNumber line number currently being linted
    lineNumber = 'Generic LineNo'

    # @property [String] level either 'ignore', 'warning', or 'failure'
    level = 'ignore'

    # Constructor for Rules, sets filename and linted node
    constructor: (@filename, @node) ->

    # Method used to check the current node for lint errors
    #
    # @abstract
    check: ->
        false

    # Causes the current test to fail by throwing a LintError.
    # Records filename, lineNumber, and level in the error
    #
    # @throw LintError
    fail: ->
        err = new LintError()
        err.level = @level
        err.name = @name
        err.filename = @filename
        err.line = @node.line
        throw err

    # Cleans the quotes from a String
    #
    # @param [String] str cleans quotes from both sides
    clean: (str) ->
        str.replace /^'/g, ''
           .replace /'$/g, ''
           .replace /^"/g, ''
           .replace /"$/g, ''

    # Runs the check method with a single jade node.
    #
    # @param [String] nodeContent the jade source to create the node from
    # @return [Boolean] describes if the test passed or failed
    validate: (nodeContent) ->
        @node = (parse lex nodeContent).nodes[0]

        try
            @check()
        catch e
            return false

        return true

module.exports = Rule
