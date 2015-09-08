expect = require('chai').expect
Reporter = require './../src/Reporter'

errors = [
    level: 'error'
    name: 'some_error'
    filename: 'some_file'
    line: 6
,
    level: 'warning'
    name: 'some_warning'
    filename: 'some_file'
    line: 4
]

multipleErrors = [
    level: 'error'
    name: 'some_error'
    filename: 'some_file'
    line: 6
,
    level: 'warning'
    name: 'some_warning'
    filename: 'some_file'
    line: 4
,
    level: 'error'
    name: 'some_error'
    filename: 'some_file'
    line: 6
,
    level: 'warning'
    name: 'some_warning'
    filename: 'some_file'
    line: 4
]

noErrors = []

describe 'Reporter', ->
    describe 'constructor', ->
        it 'should set errCount to 0', ->
            rep = new Reporter
            expect(rep.errCount).to.equal 0

        it 'should set warnCount to 0', ->
            rep = new Reporter
            expect(rep.warnCount).to.equal 0

        it 'should have a blank log', ->
            rep = new Reporter
            expect(rep.log).to.equal ''

    describe 'aggregate', ->
        it 'should process new errors', ->
            rep = new Reporter
            rep.aggregate errors, 'some_file'
            expect(rep.errCount).to.equal 1
            expect(rep.log).to.not.equal ''

        it 'should process new warnings', ->
            rep = new Reporter
            rep.aggregate errors, 'some_file'
            expect(rep.warnCount).to.equal 1
            expect(rep.log).to.not.equal ''

        it 'should not log on no errors', ->
            rep = new Reporter
            rep.aggregate noErrors, 'some_file'
            expect(rep.warnCount).to.equal 0
            expect(rep.errCount).to.equal 0
            expect(rep.log).to.equal ''

    describe 'report', ->
        it 'should log the errors', ->
            rep = new Reporter
            rep.aggregate errors, 'some_file'
            rep.report()

            expect(rep.log).to.not.equal ''

        it 'should log on no errors', ->
            rep = new Reporter
            rep.aggregate noErrors, 'some_file'
            rep.report()
            expect(rep.warnCount).to.equal 0
            expect(rep.errCount).to.equal 0
            expect(rep.log).to.not.equal ''

        it 'should log multiple errors and warning', ->
            rep = new Reporter
            rep.aggregate multipleErrors, 'some_file'
            expect(rep.errCount).to.equal 2
            expect(rep.warnCount).to.equal 2
            expect(rep.log).to.not.equal ''
