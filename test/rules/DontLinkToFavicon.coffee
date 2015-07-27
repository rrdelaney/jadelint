expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe "DontLinkToFavicon", ->
    it 'should catch when there is a relational favicon link', ->
        expect rule::validate """
        link(rel='icon' href='favicon.ico')
        """
        .to.be.false

    it 'should catch a hard favicon link', ->
        expect rule::validate """
        link(rel='icon' href='favicon.ico')
        """
        .to.be.false

    it 'should pass other element types', ->
        expect rule::validate """
        div(rel='icon' href='favicon.ico')
        """
        .to.be.true

    it 'should allow other icon names', ->
        expect rule::validate """
        link(rel='icon' href='favicon96x96.ico')
        """
        .to.be.true
