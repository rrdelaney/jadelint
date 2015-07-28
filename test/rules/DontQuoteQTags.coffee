expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontQuoteQTags', ->
    it 'should catch any quoted q element', ->
        expect rule::validate """
        q "Some Quote"
        """
        .to.be.false

    it 'should allow plain text under q', ->
        expect rule::validate """
        q Some Quote
        """
        .to.be.true

    it 'should ignore other element types', ->
        expect rule::validate """
        div(type="text/css")
        """
        .to.be.true
