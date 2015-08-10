expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'OmitTypeForJS', ->
    it 'should catch single quotes', ->
        expect rule::validate """
        script(type='text/javascript')
        """
        .to.be.false

    it 'should catch double quotes', ->
        expect rule::validate """
        script(type="text/javascript")
        """
        .to.be.false

    it 'should pass other script types', ->
        expect rule::validate """
        script(type='text/coffeescript')
        """
        .to.be.true

    it 'should pass normal script elements', ->
        expect rule::validate """
        script
        """
        .to.be.true

    it 'should ignore other element types', ->
        expect rule::validate """
        div(type="text/javascript")
        """
        .to.be.true
