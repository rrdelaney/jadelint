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
    # @param [Vinyl] file Vinyl file
    constructor: (@file) ->
        try
            @ast = parse lex @file.contents.toString()
        catch e
            @compileError =
                name: e.msg
                level: 'error'
                filename: @file.path
                line: e.line
                code: e.code

    # Recursively lints the given source
    lint: (root = @ast) ->
        if @compileError? then return [@compileError]
        errors = []
        for node in root.nodes
            errors = errors.concat rules.checkAll @file.path, node
            if node.block?
                errors = errors.concat @lint node.block

        errors

module.exports = Linter
