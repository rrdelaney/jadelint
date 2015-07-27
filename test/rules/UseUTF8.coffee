expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'UseUTF8', ->
    it 'should catch non-UTF-8 charsets', ->
        expect rule::validate """
        meta(charset='nonUTF8')
        """
        .to.be.false

    it 'should pass UTF-8 charsets', ->
        expect rule::validate """
        meta(charset='UTF-8')
        """
        .to.be.true

    it 'should ignore other elements', ->
        expect rule::validate """
        div(charset='nonUTF8')
        """
        .to.be.true
