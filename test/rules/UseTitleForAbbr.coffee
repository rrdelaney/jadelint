expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'UseTitleForAbbr', ->
    it 'should catch an abbr without a title', ->
        expect rule::validate """
        abbr OMaM
        """
        .to.be.false

    it 'should pass an ol with a type', ->
        it 'should pass single quotes', ->
            expect rule::validate """
            abbr(title='War and Peace') WaP
            """
            .to.be.true

        it 'should pass double quotes', ->
            expect rule::validate """
            abbr(title="War and Peace") WaP
            """
            .to.be.true

    it 'should ignore other elements', ->
        expect rule::validate """
        div.someClass#someId(role='nav')
        """
        .to.be.true
