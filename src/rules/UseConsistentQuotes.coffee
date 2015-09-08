Rule = require './../Rule'

class UseConsistentQuotes extends Rule
    name: 'Use consistent quotes for strings'
    level: 'ignore'
    description: """
    Make sure to use the same quote type for strings

    ```jade
    //- Invalid
    a(href="/api" thing='/docs')

    //- Valid
    a(href='/api' thing='/docs')
    ```
    """

    firstUsed: undefined

    checkString: (str) ->
        if str.match /'[\s\S]*'/g
            if @force? and @force is '"' then @fail()
            if @firstUsed is '"' then @fail() else @firstUsed = "'"
        else if str.match /"[\s\S]*"/g
            if @force? and @force is "'" then @fail()
            if @firstUsed is "'" then @fail() else @firstUsed = '"'

    check: ->
        if @force? then @name += ", expecting #{@force}"
        if @node.type is 'Tag'
            for {name, val} in @node.attrs
                @checkString val

module.exports = UseConsistentQuotes
