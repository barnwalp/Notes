## Custom CSS Selector

### CSS combinator (example shown using div and p)

- **div p** : **Descendent Selector** - select all \<p> elements nested inside of \<div> element. These \<p> elements can be nested deep inside the \<div> element.
- **div > p** : **Direct Child** - select all \<p> elements that are direct children (one level down) of \<div> element
- **div + p** : **Adjacent selector** - select the first \<p> elements that are placed immediately after \<div> element. however these elements should be on the same level. 
- **div ~ p** : select all \<p> elements that is preceded by a \<div> element. In this case, there can be some other element in between \<div> and \<p>.

### Pseudo class

- **:hover** - Matches when a user hover over an item with a pointing device, eg: holding the mouse pointer over it
- **:active** - Matches when an item is being activated by the user, for example clicked on
- **:focus** - It is generally triggered when the user clicks or taps on an element or selects it with the keyboard's Tab key
- **:checked** - represents any radio, checkbox or option elements that is checked or toggled on to an ON state.
- **:nth-of-type()** - it matches elements of a given type (tag name), based on their position among a group of siblings, 2n will select elements at even number

### Pseudo elements

- **::first-letter** - it applies styles to the first letter of the first line of a block-level element, but only when not preceded by other content (such as images or inline tables) 
- **::first-line** - applies styles to the first line of a block-level element
- **::selection** - applies styles to the part of a document that has been highlighted by the user
### selecting an element through an attribute
    `response.css('[itemprop="author"]::text').get()`

    `input[id='username']`	--- css with one attribute
    `input[id='username'][type='email']`	--- css with two attribute

- it will select tags whose id contains user
    `input[id*='between']`

- starting the text in css
    `input[id^='start']`

- ending the text in css
    `input[id$='end']`

- comma in css does union of the tags through css selector
    `div.private-form_input-wrapper, input#username`

- first-of-type in css:
    `ul#categories > li:first-of-type`

- last-of-type in css:
    `ul#categories > li:last-of-type`

- nth-of-type in css:
    `ul#categories>li:nth-of-type(3)` --- will get the 3rd li
    `ul#categories>li:nth-of-type(n)` --- will return all elements
    `ul#categories>li:nth-of-type(odd)` --- will return all odd elements
    `ul#categories>li:nth-of-type(even)` --- will return all even elements

- sibling of element in css:
    `div.private-form_input-wrapper+div` --- elements on either side of + are siblings
    `ul#categories>li:nth-of-type(3)+li` --- it will select the immediate next li

- not operator in css:
    `input.form-control.private-form_control:not(.login-password)`

## Examples - Scrapping quote hub
url - https://www.brainyquote.com/topics/scrap-quotes

- Getting all the quotes
`response.css(".m-brick.grid-item.boxy.clearfix.bqQt.r-width .b-qt::text").getall()`

- Getting all the author
`response.css(".m-brick.grid-item.boxy.clearfix.bqQt.r-width .bq-aut::text").getall()`

- Getting all the tags
` response.css(".m-brick.grid-item.boxy.clearfix.bqQt.r-width .qkw-btn::text").getall()`

- Getting the next page from the pagination
`response.css(".active~ li + li a::attr(href)").get()`

- Getting the link for authors
`response.css("a[href='/authors']::attr(href)").get()`

url - https://www.brainyquote.com/authors/a-c-benson-quotes

- Getting the birthdate of the author
`response.css(".subnav-below-p a:nth-child(4)::text").get()`