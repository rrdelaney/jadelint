expect = require('chai').expect
File = require 'vinyl'
Linter = require './../src/Linter'

describe 'Linter', ->
    describe 'constructor', ->
        it 'should set filename', ->
            linter = new Linter new File
                path: 'testFilename.jade'
                contents: new Buffer('testSource')

            expect(linter.file.path).to.equal 'testFilename.jade'

        it 'should set source', ->
            linter = new Linter new File
                path: 'testFilename.jade'
                contents: new Buffer('testSource')

            expect(linter.file.contents.toString()).to.equal 'testSource'

        it 'should set an AST', ->
            linter = new Linter new File
                path: 'testFilename.jade'
                contents: new Buffer('p.strong')

            expect(linter.ast).to.not.be.undefined

        it 'should allow the alternate use', ->
            linter = new Linter 'myFile.jade', 'p html'

            expect(linter.file.path).to.equal 'myFile.jade'
            expect(linter.file.contents.toString()).to.equal 'p html'
            expect(linter.ast).to.not.be.undefined

    describe 'lint', ->
        it 'should catch compile errors', ->
            linter = new Linter new File
                path: 'testFilename.jade'
                contents: new Buffer('p=')

            errors = linter.lint()
            expect(errors).to.have.length 1

        it 'should run on a whole jade source', ->
            linter = new Linter new File
                path: 'testFilename.jade'
                contents: new Buffer('p html')

            errors = linter.lint()
            expect(errors).to.be.empty

        it 'should error on an incorrect jade source', ->
            linter = new Linter new File
                path: 'testFilename.jade'
                contents: new Buffer('doctype xml')

            errors = linter.lint()

            expect(errors).to.not.be.empty
