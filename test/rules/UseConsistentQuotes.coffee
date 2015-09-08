expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'UseConsistentQuotes', ->
    it 'should catch statements across tags', ->
        expect rule::validate """
        a(href="/api" thing='/docs')
        """
        .to.be.false

    it 'should accept same-style quotes', ->
        expect rule::validate """
        a(href='/api' thing='/docs')
        """
        .to.be.true

        expect rule::validate """
        a(href="/api" thing="/docs")
        """
        .to.be.true

    describe 'allow forcing of quotes', ->
        it 'should validate single quotes', ->
            expect rule::validate """
            a(href='hey')
            """, force: "'"
            .to.be.true

            expect rule::validate """
            a(href='hey')
            """, force: '"'
            .to.be.false

        it 'should validate double quotes', ->
            expect rule::validate """
            a(href="hey")
            """, force: "'"
            .to.be.false

            expect rule::validate """
            a(href="hey")
            """, force: '"'
            .to.be.true
