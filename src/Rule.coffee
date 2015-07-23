class Rule
    WARNING: 'WARNING'
    FAILURE: 'FAILURE'
    IGNORE: 'IGNORE'

    constructor: (@name) ->
        console.log "RUNNING RULE #{@name}"
        @level = @IGNORE

    setLevel: (level) ->
        @level = switch level
            when @WARNING then @WARNING
            when @FAILURE then @FAILURE
            when @IGNORE then @IGNORE
            else @level

    fail: (message) ->
        err = new Error "#{message} at #{@filename}:#{@lineNumber}"
        err.name = @level
        throw err

    check: (node, @filename, @lineNumber) ->
        false

module.exports = Rule
