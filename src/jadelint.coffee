fs = require 'fs'
path = require 'path'
readdir = require 'fs-readdir-recursive'
Linter = require './Linter'
Reporter = require './Reporter'
rules = require './rules'

module.exports = jadelint = (filenames, reporter, callback) ->
    try
        conf = JSON.parse fs.readFileSync '.jadelintrc'
        for rule, confVal of conf
            switch typeof value
                when 'string'
                    try rules.rules[rule]::level = confVal
                when 'object'
                    for key, val of confVal
                        try rules.rules[rule]::[key] = val

    reporter ?= new Reporter()

    for filename in filenames
        if fs.lstatSync(filename).isDirectory()
            for subfile in readdir(filename)
                contents = fs.readFileSync path.join filename, subfile
                linter = new Linter path.join(filename, subfile), contents.toString()
                errors = linter.lint()

                reporter.aggregate errors, path.join filename, subfile


        else
            contents = fs.readFileSync filename
            linter = new Linter filename, contents.toString()
            errors = linter.lint()

            reporter.aggregate errors, filename

    exitCode = reporter.report()
    callback reporter.log, exitCode
