lex = require 'jade-lexer'
parse = require 'jade-parser'
File = require 'vinyl'
rules = require './rules'

# The base linter class.
# It loads all rule files and does a recursive lint on the entire AST
#
# @example
#     linter = new Linter 'myFile.jade', sourceOf 'myFile.jade'
#     errrors = linter.lint()
#
# Or, using Vinyl..
#
# @example
#     File = require 'vinyl'
#     linter = new Linter new File
#         path: 'myFile.jade'
#         content: new Buffer sourceOf 'myFile.jade'
#
#     errors = linter.lint()
class Linter
    # Create a new linter
    # @param [Vinyl | String] file Vinyl file, or filename
    # @param [String | undefined] contents if a filename was provided instead of a Vinyl file, the file contents should be read in
    # @param [Boolean | String | Object] conf the configuration to be applied to the rule
    constructor: (@file, contents, @conf = {}) ->
        if contents?
            @file = new File
                path: @file
                contents: new Buffer contents

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
            errors = errors.concat rules.checkAll @file.path, node, @conf
            if node.block?
                errors = errors.concat @lint node.block

        errors

module.exports = Linter
