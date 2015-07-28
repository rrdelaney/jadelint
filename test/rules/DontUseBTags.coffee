expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontUseBTags', ->
    it 'should catch any b element', ->
        expect rule::validate """
        b Some text
        """
        .to.be.false

    it 'should ignore other element types', ->
        expect rule::validate """
        div(type="text/css")
        """
        .to.be.true
