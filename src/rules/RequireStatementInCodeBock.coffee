Rule = require './../Rule'

class RequireStatementInCodeBock extends Rule
    name: 'Require Statement in Code Block'
    level: 'error'
    description: """
    All code in a code block must be a valid statement.

    ```jade
    //- Invalid
    - var n = 0;
    - while (n < 10)
        - n++
        li= n
    ```

    //- Valid
    - var n = 0;
    while (n < 10)
        - n++
        li= n
    """

    check: ->
        if @node.type is 'Code'
            try
                new Function @node.val
            catch error
                @fail()

module.exports = RequireStatementInCodeBock
