expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'HTMLRootRequiresLang', ->
    it 'should catch an html element without a lang', ->
        expect rule::validate """
        html
        """
        .to.be.false

    it 'should pass an html element with a lang attribute', ->
        expect rule::validate """
        html(lang='en-US')
        """
        .to.be.true

    it 'should pass all other elements', ->
        expect rule::validate """
        div#something
            p hey
        """
        .to.be.true
