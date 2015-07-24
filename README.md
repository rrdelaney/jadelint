# jadelint
Finds bad practices in your Jade

# Rules

### `OnlyHTMLDoctype`

`doctype` can only be set to `doctype html`

### `NoTagWhitespace`

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
