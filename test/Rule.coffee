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

        describe 'rule configuration', ->
            describe 'boolean configuration', ->
                it 'should apply true', ->
                    rule = new Rule 'testFilename', {}, true
                    expect(rule.level).to.equal 'error'

                it 'should apply false', ->
                    rule = new Rule 'testFilename', {}, false
                    expect(rule.level).to.equal 'ignore'

            describe 'string configuration', ->
                it 'should apply any string to the level', ->
                    rule = new Rule 'testFilename', {}, 'level'
                    expect(rule.level).to.equal 'level'

            describe 'object configuration', ->
                it 'should apply any key/value pair to the rule', ->
                    rule = new Rule 'testFilename', {},
                        x: 'y'
                        a: 'b'

                    expect(rule.x).to.equal 'y'
                    expect(rule.a).to.equal 'b'

    describe 'check', ->
        it 'should default to false', ->
            expect(Rule::check()).to.be.false

    describe 'fail', ->
        it 'should throw a LintError', ->
            expect(Rule::fail).to.throw LintError
