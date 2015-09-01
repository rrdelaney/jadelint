fs = require 'fs'
path = require 'path'
vinyl = require 'vinyl-fs'
Linter = require './Linter'
Reporter = require './Reporter'
rules = require './rules'

module.exports = jadelint = (files, reporter, callback) ->
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
    callback ?= -> undefined


    vinyl.src(filenames)
    .pipe (file) ->
        linter = new Linter file
        errors = linter.lint()

        reporter.aggregate errors, file.path
    .pipe ->
        exitCode = reporter.report()
        callback reporter.log, exitCode
