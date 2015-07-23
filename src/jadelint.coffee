fs = require 'fs'
Linter = require './Linter'

module.exports = jadelint = (filename) ->
    fs.readFile filename, (err, data) ->
        if err then throw err
        linter = new Linter filename, data.toString()
        errors = linter.lint()
        console.log errors
        exitCode = parseErrors errors

        if exitCode isnt 0 then process.exit 1

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
