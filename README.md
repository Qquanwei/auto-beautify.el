[![MELPA](https://melpa.org/packages/js-auto-beautify-badge.svg)](https://melpa.org/#/js-auto-beautify)

# install

* `npm install js-beautify -g`
* `M-x RET package-install RET js-auto-beautify`

# Usag:



```lisp
(require 'js-auto-beautify)

(add-hook 'js2-mode-hook 'js-auto-beautify-mode)
;; or
;; (add-hook 'web-mode 'js-auto-beautify-mode)
```

if you want support React/jsx need set web-mode content type.

```
(add-hook 'js2-mode-hook (lambda ()
  (web-mode-set-content-type "jsx")))
```

Notice : Javascript indent dependent on your `~/jsbeautifyrc` config.



# Features

before

```
 const a=0;
```
after `<enter>`
```
 const a = 0;
```

before
```
const sayHello=()=>console.log("hello");
```
after `<enter>`
```
const sayHello = () => console.log("hello");
```

before
```
function render() {
  return (
    <div>
    <ul>
    <li></li>
     <li></li>
     <li></li>
          </ul>
 </div>
  )
_ <-  cursor
```
after type `}`
```
function render() {
  return (
    <div>
      <ul>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>
  )
}
```

before
```javascript
function render() {
  const a =0;
  return (
    <div>
   <a href=""></a>
      <ul>
     <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>_ //<-  cursor
  )
}

```

after `<enter>`
just format this region that in  `<div> ... </div>`

```javascript
function render() {
  const a =0;
  return (
    <div>
      <a href=""></a>
      <ul>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>
  )
}
```

## Reference

** My jsbeautifyrc **

file : ~/.jsbeautifyrc

```
{
  "e4x": true,
  "indent_size": 2,
  "indent_char": " ",
  "other": " ",
  "indent_level": 0,
  "indent_with_tabs": false,
  "preserve_newlines": true,
  "max_preserve_newlines": 2,
  "jsline_happy": true,
  "indent_handlebars": true,
  "object":{}
}
```

** My web-mode setup **
```
(custom-set-variables
 '(web-mode-markup-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-css-colorization t)
 '(web-mode-commet-style 2)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t))
```
