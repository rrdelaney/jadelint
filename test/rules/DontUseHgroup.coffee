expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'DontUseHgroup', ->
    it 'should catch an hgroup tag', ->
        expect rule::validate """
        hgroup
            h1 title
        """
        .to.be.false

    it 'should do nothing for other elements', ->
        expect rule::validate """
        div
            h1 title
        """
        .to.be.true
