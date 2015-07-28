expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontUseITags', ->
    it 'should catch any i element', ->
        expect rule::validate """
        i Some text
        """
        .to.be.false

    it 'should ignore other element types', ->
        expect rule::validate """
        div(type="text/css")
        """
        .to.be.true
