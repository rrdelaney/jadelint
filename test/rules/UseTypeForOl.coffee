expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'UseTypeForOl', ->
    it 'should catch an ol without a type', ->
        expect rule::validate """
        ol
            li something
            li else
        """
        .to.be.false

    it 'should pass an ol with a type', ->
        expect rule::validate """
        ol(type="I")
            li something
            li else
        """
        .to.be.true

    it 'should ignore other elements', ->
        expect rule::validate """
        div.someClass#someId(role='nav')
        """
        .to.be.true
