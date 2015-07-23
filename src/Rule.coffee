class Rule
    WARNING: 'WARNING'
    FAILURE: 'FAILURE'
    IGNORE: 'IGNORE'

    name = 'Generic Rule'
    filename = 'Generic Filename'
    lineNumber = 'Generic LineNo'

    setLevel: (level) ->
        @level = switch level
            when @WARNING then @WARNING
            when @FAILURE then @FAILURE
            when @IGNORE then @IGNORE
            else @level

    fail: ->
        err = new Error "#{@name} at #{@filename}:#{@lineNumber}"
        err.name = @level
        throw err

    check: (node) ->
        false

module.exports = Rule
