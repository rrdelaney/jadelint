expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'OnlyHTMLDoctype', ->
    it 'should catch xml doctypes', ->
        expect rule::validate """
        doctype xml
        """
        .to.be.false

    it 'should catch non-html5 doctype', ->
        expect rule::validate """
        doctype transitional
        """
        .to.be.false

    it 'should pass html5 doctype', ->
        expect rule::validate """
        doctype html
        """
        .to.be.true

    it 'should ignore other elements', ->
        expect rule::validate """
        .class#id
        """
        .to.be.true
