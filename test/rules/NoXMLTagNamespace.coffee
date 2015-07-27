expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'NoXMLTagNamespace', ->
    it 'should catch any element with an xmlns attribute', ->
        expect rule::validate """
        div.someClass(xmlns='namespace')
        """
        .to.be.false

    it 'ignore other attributes', ->
        expect rule::validate """
        div.someClass(notxmlns="namespace")
        """
        .to.be.true
