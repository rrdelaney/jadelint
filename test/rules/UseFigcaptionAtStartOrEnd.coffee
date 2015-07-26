expect = require('chai').expect
UseFigCaptionAtStartOrEnd = require './../../src/rules/UseFigCaptionAtStartOrEnd'
LintError = require './../../src/LintError'

describe 'UseFigCaptionAtStartOrEnd', ->
    it 'should catch figcaption in the middle', ->
        expect ->
            UseFigCaptionAtStartOrEnd::validate """
            figure
                img(src='/img/fig.png')
                figcaption Look at this figure!
                img(src='/img/end.png')
            """
        .to.throw LintError

    it 'should pass figcaption at the beginning', ->
        expect ->
            UseFigCaptionAtStartOrEnd::validate """
            figure
                figcaption Hey! Listen!
                img(src='/img/navi.png')
            """
        .to.not.throw LintError

    it 'should pass figcaption at the end', ->
        expect ->
            UseFigCaptionAtStartOrEnd::validate """
            figure
                img(src='/img/navi')
                figcaption Hey! Listen!
            """
        .to.not.throw LintError
