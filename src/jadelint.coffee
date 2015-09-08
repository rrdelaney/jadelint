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
# @param [Function<Reporter>] callback will be called with the reporter after linting is done
#
# @return [Function] stream handler for vinyl file objects
#
# @example
#     fs.src ['*.jade']
#     .pipe jadelint myConf, undefined, (reporter) ->
#         exitCode = reporter.report()
#         console.log reporter.log
jadelint = (conf, reporter = new Reporter, callback = ->) ->
    dir = process.cwd()
    conf ?= try require "#{dir}/.jadelintrc"
    conf ?= (try require "#{dir}/.jadelintrc") while (dir += '/..'; '/' isnt fs.realpathSync dir)
    conf ?= {}

    through2.obj (file, _, cb) ->
        linter = new Linter file, undefined, conf
        reporter.aggregate linter.lint(), file.path
        cb()
    , ->
        callback reporter

module.exports = jadelint
