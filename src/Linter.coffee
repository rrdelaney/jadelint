lex = require 'jade-lexer'
parse = require 'jade-parser'
rules = require './rules'

# The base linter class.
# It loads all rule files and does a recursive lint on the entire AST
#
# @example
#     linter = new Linter 'myFile.jade', sourceOf 'myFile.jade'
#     errors = linter.lint()
class Linter
    # Create a new linter
    # @param [String] filename the filename to use for errors
    # @param [String] source the jade source to be linted
    constructor: (@filename, @source)->
        try
            @ast = parse lex @source, @filename
        catch e
            @compileError =
                name: e.msg
                level: 'error'
                filename: @filename
                line: e.line

    # Recursively lints the given source
    lint: (root = @ast) ->
        if @compileError? then return [@compileError]
        errors = []
        for node in root.nodes
            errors = errors.concat rules.checkAll @filename, node
            if node.block?
                errors = errors.concat @lint node.block

        errors

module.exports = Linter
