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
