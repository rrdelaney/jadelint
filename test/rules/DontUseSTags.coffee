expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontUseSTags', ->
    it 'should catch any s element', ->
        expect rule::validate """
        s Some text
        """
        .to.be.false

    it 'should catch plaintext in blockquote', ->
        expect rule::validate """
        blockquote plaintext
        """
        .to.be.true
