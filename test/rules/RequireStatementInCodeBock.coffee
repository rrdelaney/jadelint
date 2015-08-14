expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'RequireStatementInCodeBock', ->
    it 'should catch a non-statement in a code block', ->
        expect rule::validate """
        - while (n < 10)
            - n++
            li= n
        """
        .to.be.false

    it 'should pass jade natives', ->
        expect rule::validate """
        if this
            that
        """
        .to.be.true

        expect rule::validate """
        while this
            that
        """
        .to.be.true

    it 'should pass a statement in a code block', ->
        expect rule::validate """
        - var n = 0;
        """
        .to.be.true

    it 'should ignore other elements', ->
        expect rule::validate """
        div.someClass#someId(role='nav')
        """
        .to.be.true
