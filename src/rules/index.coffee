exports.rules = rules =
    NoBTags: require './NoBTags'

exports.checkAll = checkAll = (filename, node) ->
    errors = []
    for name, rule of rules
        try
            rule = new rule(filename, node)
            rule.check()
        catch e
            errors.push e

    errors
