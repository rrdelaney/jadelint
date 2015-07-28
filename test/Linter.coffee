expect = require('chai').expect
Linter = require './../src/Linter'

describe 'Linter', ->
    describe 'constructor', ->
        it 'should set filename', ->
            linter = new Linter 'testFilename.jade', 'testSource'
            expect(linter.filename).to.equal 'testFilename.jade'

        it 'should set source', ->
            linter = new Linter 'testFilename.jade', 'testSource'
            expect(linter.source).to.equal 'testSource'

        it 'should set an AST', ->
            linter = new Linter 'testFilename.jade', 'div.class#id'
            expect(linter.ast).to.not.be.undefined

    describe 'lint', ->
        it 'should catch compile errors', ->
            linter = new Linter 'testFilename.jade', 'p(div=")'
            errors = linter.lint()
            expect(errors).to.have.length 1

        it 'should run on a whole jade source', ->
            linter = new Linter 'testFilename.jade', 'p html'
            errors = linter.lint()

            expect(errors).to.be.empty

        it 'should error on an incorrect jade source', ->
            linter = new Linter 'testFilename.jade', 'doctype xml'
            errors = linter.lint()

            expect(errors).to.not.be.empty
