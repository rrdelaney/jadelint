expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'NoAttributeWhitespace', ->
    it 'should catch whitespace before attribute value', ->
        expect rule::validate """
        div(foo=' bar')
        """
        .to.be.false

    it 'should catch whitespace after attribute value', ->
        expect rule::validate """
        div(foo='bar ')
        """
        .to.be.false

    it 'should catch whitespace before and after value', ->
        expect rule::validate """
        div(foo=' bar ')
        """
        .to.be.false

    it 'should catch both single and double quotes', ->
        expect rule::validate """
        div(foo="bar ")
        """
        .to.be.false

    it 'should pass values with no whitespace', ->
        expect rule::validate """
        div(foo='bar')
        """
        .to.be.true

    it 'should pass code values', ->
        expect rule::validate """
        div(foo=bar)
        """
        .to.be.true
