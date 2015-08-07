fs = require 'fs'
readdir = require 'fs-readdir-recursive'
Linter = require './Linter'
Reporter = require './Reporter'
rules = require './rules'

module.exports = jadelint = (filenames, reporter) ->
    try
        conf = JSON.parse fs.readFileSync '.jadelintrc'
        try rules.rules[rule]::level = level for rule, level of conf

    reporter ?= new Reporter()

    for filename in filenames
        if fs.lstatSync(filename).isDirectory()
            for subfile in readdir(filename)
                contents = fs.readFileSync filename + '/' + subfile
                linter = new Linter filename + '/' + subfile, contents.toString()
                errors = linter.lint()

                reporter.aggregate errors, filename + '/' + subfile


        else
            contents = fs.readFileSync filename
            linter = new Linter filename, contents.toString()
            errors = linter.lint()

            reporter.aggregate errors, filename

    exitCode = reporter.report()
    console.log reporter.log
    if exitCode isnt 0 then process.exit exitCode
