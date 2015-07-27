# jadelint

[![Build Status](https://travis-ci.org/rrdelaney/jadelint.svg?branch=master)](https://travis-ci.org/rrdelaney/jadelint)

:whale:
Finds bad practices in your Jade

# Installation

```
npm install -g jadelint
```

# Usage

```
jadelint files...
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
