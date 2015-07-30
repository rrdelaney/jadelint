expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'AddTitleToAlternateStylesheets', ->
    it 'should catch no value on submit', ->
        expect rule::validate """
        input(type="submit")
        """
        .to.be.false

    it 'should pass a value on submit', ->
        expect rule::validate """
        input(type="submit" value="Search")
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
