# jadelint
Finds bad practices in your Jade

# Rules

### OnlyHTMLDoctype
__default__ error

`doctype` can only be set to `doctype html`

### NoTagWhitespace
__default__ warning

Attribute tags cannot contain edge whitespace

```jade
//- Valid
div(id='id')

//- Invalid
div(id='  id')
div(id='id  ')
div(id='  id  ')
div(id=" id")
```

### NoXMLTagNamespace
__default__ warning

A tag cannot have an `xmlns` attribute

### NoXMLAttributeNamespace
__default__ warning

An attribute cannot be namespaced with `namespace:attribute`

### PreferStrongNativeSemantics
__default__ ignore

Don't use `role=".."` on `nav`, `hr`, or `br`

### HTMLRootRequiresLang
__default__ error

The root `html` element must have a `lang` attribute

```jade
//- Valid
html(lang='en-US')
html(lang='jp')

//- Invalid
html
```

### DontLinkToFavicon
__default__ warning

Don't like directly to `favicon.ico`

```jade
//- Valid
link(rel='icon' href='favicon96x96.png')
link(rel='icon' href='favicon96x96.ico')

//- Invalid
link(rel='icon' href='favicon.ico')
```

### AddTitleToAlternateStylesheets
__default__ warning

Use a `title` attribute on alternate stylesheets

```jade
//- Valid
link(href='my.css' rel='alternate stylesheet' title='Altsheet')

//- Invalid
link(href='my.css' rel='alternate stylesheet')
```

### DontUseLegacyEncoding
__default__ error

Don't use the `<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">`
syntax for specifying charset

### UseUTF8
__default__ error

Only use `UTF-8` as the `charset`

```jade
//- Valid
meta(charset='UTF-8')

//- Invalid
meta(charset='UFT8')
meta(charset='OtherSet')
```

### OmitTypeForCSS
__default__ warning

Don't do `style(type='text/css')`

### DontUseHgroup
__default__ error

Don't use an `hgroup` tag

### DontUsePlaintextInBlockquote
__default__ ignore

Don't use plaintext in a `blockquote` tag

```jade
//- Valid
blockquote: p This is a quote

//- Invalid
blockquote This is a quote
```

### UseTypeForOl
__default__ ignore

Use a `type` attribute for `ol` tags

```jade
//- Valid
ol(type='I')
  li thing
  li other

//- Invalid
ol
  li thing
  li other
```
