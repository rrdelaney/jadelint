exports.rules = rules =
    NoBTags: require './NoBTags'

exports.checkAll = checkAll = (node, filename, lineNumber) ->
    errors = []
    for name, rule in rules
        try
            rule.lint node, filename, lineNumber
        catch e
            errors.push e

    errors
