expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontUseUTags', ->
    it 'should catch any u element', ->
        expect rule::validate """
        u Some text
        """
        .to.be.false

    it 'should catch plaintext in blockquote', ->
        expect rule::validate """
        blockquote plaintext
        """
        .to.be.true
