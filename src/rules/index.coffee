fs = require 'fs'

exports.rules = rules = []

do ->
    files = fs.readdirSync __dirname
    for file in files when file isnt 'index.coffee' and file isnt 'index.js'
        rules[file.split('.').slice(0, -1).join('.')] = require "./#{file}"

exports.checkAll = checkAll = (filename, node) ->
    errors = []
    for name, rule of rules
        try
            rule = new rule filename, node
            rule.check()
        catch e
            errors.push e

    errors
