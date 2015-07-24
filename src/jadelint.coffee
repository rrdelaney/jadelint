fs = require 'fs'
Linter = require './Linter'
Reporter = require './Reporter'

module.exports = jadelint = (filename) ->
    fs.readFile filename, (err, data) ->
        if err then throw err
        linter = new Linter filename, data.toString()
        errors = linter.lint()

        reporter = new Reporter()
        reporter.aggregate errors, filename
        exitCode = reporter.report()

        if exitCode isnt 0 then process.exit exitCode
