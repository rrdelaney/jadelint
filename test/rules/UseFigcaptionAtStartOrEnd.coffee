expect = require('chai').expect
rule = require "./../../src/rules/#{require('path').basename(__filename, '.coffee')}"

describe 'UseFigCaptionAtStartOrEnd', ->
    it 'should catch figcaption in the middle', ->
        expect rule::validate """
        figure
            img(src='/img/fig.png')
            figcaption Look at this figure!
            img(src='/img/end.png')
        """
        .to.be.false

    it 'should pass figcaption at the beginning', ->
        expect rule::validate """
        figure
            figcaption Hey! Listen!
            img(src='/img/navi.png')
        """
        .to.be.true

    it 'should pass figcaption at the end', ->
        expect rule::validate """
        figure
            img(src='/img/navi')
            figcaption Hey! Listen!
        """
        .to.be.true
