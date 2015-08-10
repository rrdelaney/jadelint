expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'AddDeferForAsyncScripts', ->
    it 'should catch script with async without defer', ->
        expect rule::validate """
        script(async src='script.js')
        """
        .to.be.false

    it 'should pass script with async and defer', ->
        expect rule::validate """
        script(async defer src='script.js')
        """
        .to.be.true

    it 'should pass normal scripts', ->
        expect rule::validate """
        script(src='script.js')
        """
        .to.be.true

    it 'should no nothing for other elements', ->
        expect rule::validate """
        div(href='/css/myStyle.css' rel='stylesheet')
        """
        .to.be.true
