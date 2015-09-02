fs = require 'fs'
path = require 'path'
through2 = require 'through2'
Reporter = require './Reporter'
Linter = require './Linter'
rules = require './rules'

module.exports = jadelint = (conf = {}, reporter = new Reporter, callback = ->) ->
    for rule, confVal of conf
        switch typeof confVal
            when 'string'
                try rules.rules[rule]::level = confVal
            when 'boolean'
                try rules.rules[rule]::level = 'ignore'
            when 'object'
                for key, val of confVal
                    try rules.rules[rule]::[key] = val

    through2.obj (file, _, cb) ->
        linter = new Linter file
        reporter.aggregate linter.lint(), file.path
        cb()
    , ->
        callback reporter
