expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'NoXMLAttributeNamespace', ->
    it 'should catch namespaced attributes', ->
        expect rule::validate """
        div(ns:foo='bar')
        """
        .to.be.false

    it 'should pass xlink:href', ->
        expect rule::validate """
        use(xlink:href='/images/sprite.symbol.svg#test')
        """
        .to.be.true

    it 'should pass normal attributes', ->
        expect rule::validate """
        div(foo='bar')
        """
        .to.be.true

    it 'should catch with multiple values', ->
        expect rule::validate """
        div(foo='bar' ns:foo='bar')
        """
        .to.be.false
