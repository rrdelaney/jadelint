expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontUseLegacyEncoding', ->
    it 'should catch a specific tag', ->
        expect rule::validate """
        meta(http-equiv='Content-Type' content='text/html; charset=UTF-8')
        """
        .to.be.false

    it 'should ignore other element types', ->
        expect rule::validate """
        div(http-equiv='Content-Type' content='text/html; charset=UTF-8')
        """
        .to.be.true
