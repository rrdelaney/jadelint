expect = require('chai').expect
UseFigCaptionAtStartOrEnd = require './../src/Rules/UseFigCaptionAtStartOrEnd'
LintError = require './../src/LintError'
lex = require 'jade-lexer'
parse = require 'jade-parser'

jade = (str) -> parse lex str

describe 'UseFigCaptionAtStartOrEnd', ->
    it 'should catch figcaption in the middle', ->
        expect UseFigCaptionAtStartOrEnd::validate jade """
        figure
            img(src='/img/fig.png')
            figcaption Look at this figure!
            img(src='/img/end.png')
        """
        .to.throw LintError
