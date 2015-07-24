# jadelint
Finds bad practices in your Jade

# Rules

### OnlyHTMLDoctype
__default__ FAILURE

`doctype` can only be set to `doctype html`

### NoTagWhitespace
__default__ WARNING

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
__default__ WARNING

A tag cannot have an `xmlns` attribute

### NoXMLAttributeNamespace
__default__ WARNING

An attribute cannot be namespaced with `namespace:attribute`

### PreferStrongNativeSemantics
__default__ IGNORE

Don't use `role=".."` on `nav`, `hr`, or `br`

### HTMLRootRequiresLang
__default__ FAILURE

The root `html` element must have a `lang` attribute

```jade
//- Valid
html(lang='en-US')
html(lang='jp')

//- Invalid
html
```

### DontLinkToFavicon
__default__ WARNING

Don't like directly to `favicon.ico`

```jade
//- Valid
link(rel='icon' href='favicon96x96.png')
link(rel='icon' href='favicon96x96.ico')

//- Invalid
link(rel='icon' href='favicon.ico')
```

### AddTitleToAlternateStylesheets
__default__ WARNING

Use a `title` attribute on alternate stylesheets

```jade
//- Valid
link(href='my.css' rel='alternate stylesheet' title='Altsheet')

//- Invalid
link(href='my.css' rel='alternate stylesheet')
```

### DontUseLegacyEncoding
__default__ FAILURE

Don't use the `<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">`
syntax for specifying charset

### UseUTF8
__default__ FAILURE

Only use `UTF-8` as the `charset`

```jade
//- Valid
meta(charset='UTF-8')

//- Invalid
meta(charset='UFT8')
meta(charset='OtherSet')
```

### OmitTypeForCSS
__default__ WARNING

Don't do `style(type='text/css')`
