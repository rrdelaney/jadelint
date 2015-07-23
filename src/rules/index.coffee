exports.rules = rules =
    NoBTags: require './NoBTags'

exports.checkAll = checkAll = (node, filename, lineNumber) ->
    errors = []
    for name, rule of rules
        try
            rule = new rule(filename, lineNumber)
            rule.check node
        catch e
            errors.push e

    errors
