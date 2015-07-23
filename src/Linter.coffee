lex = require 'jade-lexer'
parser = require 'jade-parser'
rules = require './rules'

class Linter
    constructor: (@filename, @source) ->
        tokens = lex @source, @filename
        @ast = parser tokens

    lint: ->
        errors = []
        for node in @ast
            errors.concat rules.checkAll node

        errors

module.exports = Linter
