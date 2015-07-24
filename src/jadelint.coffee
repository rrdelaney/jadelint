fs = require 'fs'
Linter = require './Linter'

module.exports = jadelint = (filename) ->
    fs.readFile filename, (err, data) ->
        if err then throw err
        linter = new Linter filename, data.toString()
        errors = linter.lint()
        exitCode = parseErrors errors

        if exitCode isnt 0 then process.exit exitCode

parseErrors = (errors) ->
    exitCode = 0
    warning = false
    for err in errors
        switch err.name
            when 'WARNING'
                console.log "#{err.name}: #{err.message}"
                warning = true
            when 'FAILURE'
                console.log "#{err.name}: #{err.message}"
                exitCode = 1
            when 'IGNORE'
                undefined
            else
                console.log "ERROR: #{err}"
                exitCode = 1

    if exitCode is 0 and not warning then console.log "Good job :)"

    exitCode
