expect = require('chai').expect
Rule = require './../src/Rule'
LintError = require './../src/LintError'

describe 'Rule', ->
    describe 'name', ->
        it 'should have a default', ->
            expect(Rule::name).to.not.be.undefined

    describe 'filename', ->
        it 'should have a default', ->
            expect(Rule::filename).to.not.be.undefined

    describe 'lineNumber', ->
        it 'should have a default', ->
            expect(Rule::lineNumber).to.not.be.undefined

    describe 'level', ->
        it 'should have a default', ->
            expect(Rule::level).to.not.be.undefined

    describe 'constructor', ->
        it 'should set filename', ->
            rule = new Rule 'testFilename', {}
            expect(rule.filename).to.equal 'testFilename'

        it 'should set node', ->
            rule = new Rule 'testFilename', {}
            expect(rule.node).to.eql {}

    describe 'check', ->
        it 'should default to false', ->
            expect(Rule::check()).to.be.false

    describe 'fail', ->
        it 'should throw a LintError', ->
            expect(Rule::fail).to.throw LintError
