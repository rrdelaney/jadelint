fs = require 'fs'
path = require 'path'
through2 = require 'through2'
Reporter = require './Reporter'
Linter = require './Linter'
rules = require './rules'

# Front function to call jadelint from
# Will instantiate a appyl the config, lint, report, and then call a callback
#
# @param [Object] conf the jadelintrc object
# @param [Reporter] reporter a reporter to use instead of the default reporter
# @param [Function<Reporter>] callback will be called with the reporter after
#                                  linting is done
#
# @return a stream handler for vinyl file objects
#
# @example
#     fs.src ['*.jade']
#     .pipe jadelint myConf, undefined, (reporter) ->
#         exitCode = reporter.report()
#         console.log reporter.log
jadelint = (conf, reporter = new Reporter, callback = ->) ->
    conf ?= try require "#{process.cwd()}/.jadelintrc"
    conf ?= {}

    through2.obj (file, _, cb) ->
        linter = new Linter file, undefined, conf
        reporter.aggregate linter.lint(), file.path
        cb()
    , ->
        callback reporter

module.exports = jadelint
