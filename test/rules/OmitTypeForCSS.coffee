expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'OmitTypeForCSS', ->
    it 'should catch when the type is text/css', ->
        it 'should catch single quotes', ->
            expect rule::validate """
            style(type='text/css')
            """
            .to.be.false

        it 'should catch double quotes', ->
            expect rule::validate """
            style(type="text/css")
            """
            .to.be.false

    it 'should pass other style types', ->
        expect rule::validate """
        style(type='text/less')
        """
        .to.be.true

    it 'should pass normal style elements', ->
        expect rule::validate """
        style
        """
        .to.be.true

    it 'should ignore other element types', ->
        expect rule::validate """
        div(type="text/css")
        """
        .to.be.true
