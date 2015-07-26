expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'AddTitleToAlternateStylesheets', ->
    it 'should catch no title on alt stylesheets', ->
        expect rule::validate """
        link(href='/css/myStyle.css' rel='alternate stylesheet')
        """
        .to.be.false

    it 'should pass titles on alternate stylesheets', ->
        expect rule::validate """
        link(href='/css/myStyle.css' rel='alternate stylesheet' title='Alt Sheet')
        """
        .to.be.true

    it 'should pass normal styleseets without title', ->
        expect rule::validate """
        link(href='/css/myStyle.css' rel='stylesheet')
        """
        .to.be.true
