expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'PreferStrongNativeSemantics', ->
    it 'should prevent role attribute on nav', ->
        expect rule::validate """
        nav(role='navigation')
        """
        .to.be.false

    it 'should prevent role attribute on hr', ->
        expect rule::validate """
        hr(role='separator')
        """
        .to.be.false

    it 'should prevent role attribute on br', ->
        expect rule::validate """
        br(role='separator')
        """
        .to.be.false

    it 'should allow nav without role attribute', ->
        expect rule::validate """
        nav
        """
        .to.be.true

    it 'should allow hr without role attribute', ->
        expect rule::validate """
        hr
        """
        .to.be.true

    it 'should allow br without role attribute', ->
        expect rule::validate """
        br
        """
        .to.be.true

    it 'should ignore other elements', ->
        expect rule::validate """
        div.someClass#someId(role='nav')
        """
        .to.be.true
