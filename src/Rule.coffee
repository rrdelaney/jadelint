class Rule
    WARNING: 'WARNING'
    FAILURE: 'FAILURE'
    IGNORE: 'IGNORE'

    name = 'Generic Rule'
    filename = 'Generic Filename'
    lineNumber = 'Generic LineNo'
    level = @IGNORE

    constructor: (@filename, @node) ->

    setLevel: (level) ->
        @level = switch level
            when @WARNING then @WARNING
            when @FAILURE then @FAILURE
            when @IGNORE then @IGNORE
            else @level

    check: (node) ->
        false

    fail: ->
        err = new Error "#{@name} at #{@filename}:#{@node.line}"
        err.name = @level
        throw err

    clean: (str) ->
        str.replace /^'/g, ''
           .replace /'$/g, ''
           .replace /^"/g, ''
           .replace /"$/g, ''

module.exports = Rule
