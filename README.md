# [jadelint](http://ryandelaney.io/jadelint)

[![Build Status](https://travis-ci.org/rrdelaney/jadelint.svg?branch=master)](https://travis-ci.org/rrdelaney/jadelint)
[![Coverage Status](https://coveralls.io/repos/rrdelaney/jadelint/badge.svg?branch=master&service=github)](https://coveralls.io/github/rrdelaney/jadelint?branch=master)
[![Dependency Status](https://david-dm.org/rrdelaney/jadelint.svg)](https://david-dm.org/rrdelaney/jadelint)

Finds bad practices in your Jade

[Demo](http://showterm.io/dfea6ec6a2bef2a4d5a56) |
[Rules Documentation](http://rdel.io/jadelint) |
[API Documentation](http://rdel.io/jadelint/api) |
[Gulp plugin](https://github.com/patwork/gulp-jadelint) |
[Grunt plugin](https://github.com/rrdelaney/grunt-jadelint)

Please don't hesitate to open issues with feature requests or bugs! 

# Installation

```
npm install -g jadelint
```

# Usage

```
jadelint myFile.jade otherFile.jade myDirectory
```

# Configuration

Put custom rule levels in `.jadelintrc`. Example
```json
{
    "HTMLRootRequiresLang": "ignore"
}
```

# Developing

```
git clone https://github.com/rrdelaney/jadelint
cd jadelint
grunt
```
