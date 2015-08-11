chalk = require 'chalk'
symbol = require 'log-symbols'
table = require 'text-table'

# Default reporter for Jadelint.
# Other reports should implement the same interface
#
# @example
#     linter = new Linter 'myFile.jade', sourceOf 'myFile.jade'
#     reporter = new Reporter
#     errors = linter.lint()
#     reporter.aggregate errors, 'myFile.jade'
#     reporter.report()
class Reporter
    # Create a new blank reporter
    constructor: ->
        @errCount = 0
        @warnCount = 0
        @log = ''

    # Collect a report of errors from a lint result
    #
    # @param [Array<LintError>] errors list of all errors that occured during lint
    # @param [String] filename the file linted
    aggregate: (errors, filename) ->
        filename ?= errors[0]?.filename
        fileErrCount = 0
        fileWarnCount = 0

        errTable = table errors.filter((err) -> err.level? and err.level isnt 'ignore').map (err) ->
            {level, name, filename, line} = err
            if level is 'error' then fileErrCount++
            if level is 'warning' then fileWarnCount++

            [
                ''
                symbol[level]
                chalk.grey "line #{line}"
                chalk.blue name
            ]

        if filename and fileErrCount > 0 or fileWarnCount > 0 then @log += "\n#{chalk.underline filename}\n" else ''
        @errCount += fileErrCount
        @warnCount += fileWarnCount
        @log += errTable
        if errors.length isnt 0 then @log += '\n'

    # Reports all errors to the console
    report: ->
        @log += '\n'

        if @warnCount > 0
            @log += chalk.yellow "#{symbol.warning}  #{@warnCount} warning#{if @warnCount isnt 1 then 's' else ''}\n"

        if @errCount > 0
            @log += chalk.red "#{symbol.error}  #{@errCount} warning#{if @errCount isnt 1 then 's' else ''}\n"

        if @errCount is 0 and @warnCount is 0
            @log += chalk.green "#{symbol.success} No problems found!\n"
            problems = false
        else
            problems = true

        if problems then 1 else 0

module.exports = Reporter
