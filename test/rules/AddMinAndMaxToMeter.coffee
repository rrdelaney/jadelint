expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'AddMinAndMaxToMeter', ->
    it 'should catch meter with no max or min', ->
        expect rule::validate """
        meter(value='0.5')
        """
        .to.be.false

    it 'should catch a meter with no max', ->
        expect rule::validate """
        meter(value='50' min='0')
        """
        .to.be.false

    it 'should catch a meter with no min', ->
        expect rule::validate """
        meter(value='50' max='100')
        """
        .to.be.false

    it 'should pass a meter with a min and max', ->
        expect rule::validate """
        meter(value='50' min='0' max='100')
        """
        .to.be.true

    it 'should no nothing for other elements', ->
        expect rule::validate """
        div(href='/css/myStyle.css' rel='stylesheet')
        """
        .to.be.true
