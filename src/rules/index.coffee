fs = require 'fs'

rules = {}

do ->
    files = fs.readdirSync __dirname
    for file in files when file isnt 'index.coffee' and file isnt 'index.js'
        rules[file.split('.').slice(0, -1).join('.')] = require "./#{file}"

checkAll = (filename, node, conf) ->
    errors = []
    for name, rule of rules
        try
            rule = new rule filename, node, conf[name]
            rule.check()
        catch e
            errors.push e

    errors

exports.rules = rules
exports.checkAll = checkAll
