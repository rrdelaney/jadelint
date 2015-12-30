### AddDeferForAsyncScripts
_Add defer for async JS scripts_

__default__: warning

Use `defer` attributes on scripts with the `async` attribute

```jade
//- Valid
script(async defer src='script.js')

//- Invalid
script(async src='script.js')

### AddMaxToProgress
_Add max attribute to progress elements_

__default__: warning

All `progress` elements must also have a `max` attribute

```jade
//- Valid
progress(value='50' max='100')

//- Invalid
progress(value='0.5')
```

### AddMinAndMaxToMeter
_Add min and max attributes to meter elements_

__default__: warning

All `meter` elements must also have `min` and `max` attributes

```jade
//- Valid
meter(value='50' max='100' min='0')

//- Invalid
meter(value='0.5')
```

### AddTitleToAlternateStylesheets
_Add title to alternate stylesheet_

__default__: warning

Use a `title` attribute on alternate stylesheets

```jade
//- Valid
link(href='my.css' rel='alternate stylesheet' title='Altsheet')

//- Invalid
link(href='my.css' rel='alternate stylesheet')
```

### AddTitleToInputWithPattern
_Add title attibute to input element when there is pattern attribute_

__default__: warning

When an `input` element has a `pattern` attribute include a `title`
attribute.

```jade
//- Valid
input(pattern='[0-9]{3}' title='PIN Number')

//- Invalid
input(pattern='[0-9]{3}')
```

### AddValueToSubmit
_Add value attribute to submit types_

__default__: warning

Add value attribute to `input(type='submit')`

```jade
//- Valid
input(type="submit" value="Search")

//- Invalid
input(type="submit")
```

### DontLinkToFavicon
_Dont link to favicon.ico_

__default__: warning

Don't like directly to `favicon.ico`

```jade
//- Valid
link(rel='icon' href='favicon96x96.png')
link(rel='icon' href='favicon96x96.ico')

//- Invalid
link(rel='icon' href='favicon.ico')
```

### DontQuoteQTags
_Dont use quotes in a q tag_

__default__: warning

Dont use quotes in a `q` tag

```jade
//- Valid
q This is a quote

//- Invalid
q "This is a quote"
```

### DontUseBTags
_Dont Use b Tags_

__default__: warning

Don't use b tags

```jade
//- Invalid
b Some text
```

### DontUseHgroup
_Dont use the hgroup tag_

__default__: error

Don't use an `hgroup` tag

### DontUseITags
_Dont Use i Tags_

__default__: ignore

Don't use i tags

```jade
//- Invalid
i Some text
```

### DontUseLegacyEncoding
_Dont use legacy encoding format_

__default__: error

Don't use the
`<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">`
syntax for specifying charset

### DontUsePlaintextInBlockquote
_Dont use plaintext in a blockquote tag_

__default__: ignore

Don't use plaintext in a `blockquote` tag

```jade
//- Valid
blockquote: p This is a quote

//- Invalid
blockquote This is a quote
```

### DontUseSTags
_Dont Use s Tags_

__default__: warning

Don't use s tags

```jade
//- Invalid
s Some text
```

### DontUseUTags
_Dont Use u Tags_

__default__: warning

Don't use u tags

```jade
//- Invalid
u Some text
```

### FirstChildOfFieldsetIsLegend
_Only use the legent tag at start of a fieldset_

__default__: ignore

Only use the `legend` tag at the beginning of a `fieldset` tag

```jade
//- Valid
fieldset
  legend about
  p Some text

//- Invalid
    fieldset
      p Some text
      legend about
```

### HTMLRootRequiresLang
_HTML root requires a lang attribute_

__default__: error

The root `html` element must have a `lang` attribute

```jade
//- Valid
html(lang='en-US')
html(lang='jp')

//- Invalid
html
```

### NoAttributeWhitespace
_No Whitespace is allowed around attribute values_

__default__: warning

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

### NoXMLAttributeNamespace
_No namespacing of attributes attribute allowed_

__default__: warning

An attribute cannot be namespaced with `namespace:attribute`

### NoXMLTagNamespace
_No xmlns attribute allowed_

__default__: warning

A tag cannot have an `xmlns` attribute

### OmitTypeForCSS
_Omit type attribute for CSS styles_

__default__: warning

Don't do `style(type='text/css')`

### OmitTypeForJS
_Omit type attribute for JS scripts_

__default__: warning

Don't do `script(type='text/javascript')`

### OnlyHTMLDoctype
_Only HTML doctypes are allowed_

__default__: error

`doctype` can only be set to `doctype html`

### PreferStrongNativeSemantics
_Prefer strong native semantics_

__default__: ignore

Don't use `role=".."` on `nav`, `hr`, or `br`

### RequireStatementInCodeBock
_Statements in code blocks must be valid JS_

__default__: error

All code in a code block must be a valid statement.

```jade
//- Invalid
- var n = 0;
- while (n < 10)
    - n++
    li= n
```

//- Valid
- var n = 0;
while (n < 10)
    - n++
    li= n

### UseConsistentQuotes
_Use consistent quotes for strings_

__default__: ignore

Make sure to use the same quote type for strings

```jade
//- Invalid
a(href="/api" thing='/docs')

//- Valid
a(href='/api' thing='/docs')
```

### UseFigcaptionAtStartOrEnd
_Only use the figcaption tag at start or end of figure_

__default__: warning

Only use the `figcaption` tag at the beginning or end of a `figure` tag

```jade
//- Valid
figure
  img(src='/img/figure1.png' alt='Some Figure')
  figcaption Figure 1

figure
    figcaption Figure 1
    img(src='/img/figure1.png' alt='Some Figure')

//- Invalid
figure
    img(src='/img/figure1.png' alt='Some Figure')
    figcaption Figure 1
    img(src='/img/figure1.png' alt='Some Figure')
```

### UseTitleForAbbr
_Use a title attribute on abbr elements_

__default__: warning

Use a `title` attribute for `abbr` tags

```jade
//- Valid
abbr(title='War and Peace') WaP
abbr(title="Of Mice and Men") OMaM

//- Invalid
abbr OMaM
```

### UseTypeForOl
_Use a type attribute for ol tags_

__default__: ignore

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

### UseUTF8
_Only use UTF-8 as charset_

__default__: error

Only use `UTF-8` as the `charset`

```jade
//- Valid
meta(charset='UTF-8')

//- Invalid
meta(charset='UFT8')
meta(charset='OtherSet')
```

