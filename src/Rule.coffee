lex = require 'jade-lexer'
parse = require 'jade-parser'
LintError = require './LintError'

# The general rule class from which other inherit
#
# @abstract
class Rule
    # @property [String] the name of the rule
    name: 'Generic Rule'

    # @property [String] filename currently being linted
    filename: 'Generic Filename'

    # @property [Number] lineNumber line number currently being linted
    lineNumber: 'Generic LineNo'

    # @property [String] level either 'ignore', 'warning', or 'failure'
    level: 'ignore'

    # Constructor for Rules, sets filename and linted node
    #
    # @param [String] filename the name of the file being linted
    # @param [Node] node the jade node being linted
    # @param [Boolean|String|Object] conf the configuration object to apply to the rule
    #
    # To apply configuration to the rule, use the conf argument. If a
    # boolean is provided, the level will be set to 'ignore' if false and 'error'
    # if true. If a string is given, the level is set to that string. If an
    # object is given, any property of the object will be applied to the rule.
    constructor: (@filename, @node, conf = {}) ->
        if typeof conf is 'boolean'
            @level = if conf then 'error' else 'ignore'
        else if typeof conf is 'string'
            @level = conf
        else
            for key, val of conf
                @[key] = val

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
        err.line = @node?.line
        err.jadelint = true
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
    validate: (nodeContent, conf = {}) =>
        node = (parse lex nodeContent).nodes[0]
        r = new @constructor 'testFilename', node, conf

        try
            r.check()
        catch e
            if not e.jadelint then throw e
            return false

        return true

module.exports = Rule
