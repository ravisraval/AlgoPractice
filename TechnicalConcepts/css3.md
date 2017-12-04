* margin is NOT additive
  * if two boxes right next to each other both request 50px of margin, you'll only see 50px

* you can't put a width and a height on an inline element.
  * it takes up the space it needs
  * padding works, but is weird. any content below writes over the padding
    * anything declared later takes precedence

#### nomenclature
ex: .my-class {
  color: blue;
  text-align: center;
  font-size: 20px;
}

* Selector:
  * in above example, .my-class is the selector
* Declaration block:
  * in above example, everything else
  * Declaration blocks consist of *declarations*
  * Declarations consist of *css properties* and their corresponding *declared values*.
    * ex: color (property): blue (declared value);

## How CSS is processed by the browser

#### Cascade (C in CSS)
* Process of combining different stylesheets and resolving conflicts between CSS rules
and declarations, when more than one rule applies to a certain element

#### Three sources of declarations:
1. Author: the ones the developer makes * most common *
2. User: user changes default font in browser, etc.
3. Browser (user agent): things the browser does automatically, such as
the browser rendering links with blue text and underline if the developer doesn't set any styling rules


#### How browser selects which rules to use
**IN ORDER**
1. Importance:
  1. User !important declarations
  2. Author !important declarations
  3. Author declarations
  4. User declarations
  5. Default browser declarations

2. Specificity, **only applies if rules have same importance**:
  1. Inline styles
  2. IDs
  3. Classes, pseudo-classes, attributes
  4. Elements, pseudu-elements
