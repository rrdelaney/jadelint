lex = require 'jade-lexer'
parse = require 'jade-parser'
rules = require './rules'

class Linter
    constructor: (@filename, @source) ->
        @ast = parse lex @source, @filename

    lint: (root = @ast) ->
        errors = []
        for node in root.nodes
            errors = errors.concat rules.checkAll node
            if node.block?
                errors = errors.concat @lint node.block
            if node.nodes?
                errors = errors.concat @lint subnode for subnode in node.nodes

        errors

module.exports = Linter
