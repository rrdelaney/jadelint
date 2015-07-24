fs = require 'fs'
Linter = require './Linter'
Reporter = require './Reporter'

module.exports = jadelint = (filenames, reporter) ->
    reporter ?= new Reporter()

    for filename in filenames
        contents = fs.readFileSync filename
        linter = new Linter filename, contents.toString()
        errors = linter.lint()

        reporter.aggregate errors, filename

    exitCode = reporter.report()
    if exitCode isnt 0 then process.exit exitCode
