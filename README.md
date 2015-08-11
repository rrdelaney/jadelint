# [jadelint](http://ryandelaney.io/jadelint)

[![Build Status](https://travis-ci.org/rrdelaney/jadelint.svg?branch=master)](https://travis-ci.org/rrdelaney/jadelint)
[![Coverage Status](https://coveralls.io/repos/rrdelaney/jadelint/badge.svg?branch=master&service=github)](https://coveralls.io/github/rrdelaney/jadelint?branch=master)

Finds bad practices in your Jade

http://showterm.io/dfea6ec6a2bef2a4d5a56

Rules Documentation: http://ryandelaney.io/jadelint

API Documentation: http://ryandelaney.io/jadelint/api

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
