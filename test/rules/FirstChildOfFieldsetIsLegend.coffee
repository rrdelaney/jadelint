expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'FirstChildOfFieldsetIsLegend', ->
    it 'should leave no legend', ->
        expect rule::validate """
        fieldset
            p Some text
        """
        .to.be.true

    it 'should catch legend after first', ->
        expect rule::validate """
        fieldset
            p Some text
            legend about
        """
        .to.be.false

    it 'should pass legend at start', ->
        expect rule::validate """
        fieldset
            legend about
            p Some text
        """
        .to.be.true

    it 'should pass all other elements', ->
        expect rule::validate """
        div#something
            p hey
            legend about
        """
        .to.be.true
