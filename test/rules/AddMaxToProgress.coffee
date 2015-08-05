expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'AddMaxToProgress', ->
    it 'should catch progress with no max', ->
        expect rule::validate """
        progress(value='0.5')
        """
        .to.be.false

    it 'should pass a progress with max', ->
        expect rule::validate """
        progress(value='50' max='100')
        """
        .to.be.true

    it 'should no nothing for other elements', ->
        expect rule::validate """
        div(href='/css/myStyle.css' rel='stylesheet')
        """
        .to.be.true
