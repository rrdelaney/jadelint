fs = require 'fs'
Linter = require './Linter'
Reporter = require './Reporter'

module.exports = jadelint = (args) ->
    reporter = new Reporter()

    lintFiles = (filenames, callback) ->
        filename = filenames.pop()
        if not filename?
            callback()
        else
            fs.readFile filename, (err, data) ->
                if err then throw err
                linter = new Linter filename, data.toString()
                errors = linter.lint()

                reporter.aggregate errors, filename
                lintFiles filenames, callback

    lintFiles args, ->
        exitCode = reporter.report()
        if exitCode isnt 0 then process.exit exitCode
