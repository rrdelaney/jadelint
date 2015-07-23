fs = require 'fs'
Linter = require './Linter'

module.exports = jadelint = (filename) ->
    fs.readFile filename, (err, data) ->
        if err then throw new Error err
        linter = new Linter filename, data
        errors = linter.lint()
        exitCode = parseErrors errors

        exitCode

parseErrors = (errors) ->
    exitCode = 0
    for err in errors
        switch err.name
            when 'WARNING'
                console.log "#{err.name}: #{err.message}"
            when 'FAILURE'
                console.log "#{err.name}: #{err.message}"
                exitCode = 1

    exitCode
