expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'UseConsistentQuotes', ->
    it 'should catch statements across tags', ->
        rule::reset()

        expect rule::validate """
        a(href="/api" thing='/docs')
        """
        .to.be.false
        
    it 'should accept same-style quotes', ->
        rule::reset()

        expect rule::validate """
        a(href='/api' thing='/docs')
        """
        .to.be.true

    it 'should do nothing for other elements', ->
        rule::reset()

        expect rule::validate """
        div(href='/css/myStyle.css' rel='stylesheet')
        """
        .to.be.true
