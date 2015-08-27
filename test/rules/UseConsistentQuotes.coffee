expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'UseConsistentQuotes', ->
    it 'should catch statements across tags', ->
        expect rule::validate """
        a(href="/api")
        a(href='/docs')
        """
        .to.be.false

        rule::reset()

    it 'should catch statements across codeblocks and tags'

    it 'should accept same-style quotes', ->
        expect rule::validate """
        p= 'hey there!'
        a(href='/api')
        """
        .to.be.true

        rule::reset()

    it 'should do nothing for other elements', ->
        expect rule::validate """
        div(href='/css/myStyle.css' rel='stylesheet')
        """
        .to.be.true
