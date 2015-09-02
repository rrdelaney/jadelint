fs = require 'fs'
path = require 'path'
through2 = require 'through2'
Reporter = require './Reporter'
Linter = require './Linter'
rules = require './rules'

# Front function to call jadelint from
# Will instantiate a appyl the config, lint, report, and then call a callback
#
# @option [Object] conf the jadelintrc object
# @option [Reporter] reporter a reporter to use instead of the default reporter
# @option [Function<Reporter>] callback will be called with the reporter after
#                                  linting is done
#
# @example
#     fs.src ['*.jade']
#     .pipe jadelint myConf, undefined, (reporter) ->
#         exitCode = reporter.report()
#         console.log reporter.log
jadelint = (conf, reporter = new Reporter, callback = ->) ->
    conf ?= try require "#{process.cwd()}/.jadelintrc"
    conf ?= {}

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
