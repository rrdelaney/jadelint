lex = require 'jade-lexer'
parse = require 'jade-parser'
rules = require './rules'

class Linter
    constructor: (@filename, @source, @config =  {})->
        try
            @ast = parse lex @source, @filename
        catch e
            @compileError = e

        rules[rule]::level = level for rule, level of @config

    lint: (root = @ast) ->
        if @compileError? then return [@compileError]
        errors = []
        for node in root.nodes
            errors = errors.concat rules.checkAll @filename, node
            if node.block?
                errors = errors.concat @lint node.block
            if node.nodes?
                errors = (errors.concat @lint subnode for subnode in node.nodes)

        errors

module.exports = Linter
