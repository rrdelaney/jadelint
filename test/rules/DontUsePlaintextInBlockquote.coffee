expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontUsePlaintextInBlockquote', ->
    it 'should allow any element under blockquote', ->
        expect rule::validate """
        blockquote
            p Hey there
        """
        .to.be.true

    it 'should pass no element under blockquote', ->
        expect rule::validate """
        blockquote
        """
        .to.be.true

    it 'should catch plaintext in blockquote', ->
        expect rule::validate """
        blockquote plaintext
        """
        .to.be.false
