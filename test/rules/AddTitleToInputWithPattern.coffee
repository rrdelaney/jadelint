expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'AddTitleToAlternateStylesheets', ->
    it 'should catch no title with pattern', ->
        expect rule::validate """
        input(pattern="[0-9]{3}")
        """
        .to.be.false

    it 'should pass a value on submit', ->
        expect rule::validate """
        input(pattern="[0-9]{3}" title="Pin Number")
        """
        .to.be.true

    it 'should pass other inputs', ->
        expect rule::validate """
        input(type='text')
        """
        .to.be.true

    it 'should no nothing for other elements', ->
        expect rule::validate """
        div(href='/css/myStyle.css' rel='stylesheet')
        """
        .to.be.true
