## Custom CSS Selector

- CSS combinator (example shown using div and p)
    - **div p** : select all \<p> elements inside of \<div> element
    - **div > p** : select all \<p> elements that are direct children of \<div> element
    - **div + p** : select the first \<p> elements that are placed immediately after \<div> element
    - **div ~ p** : select all \<p> elements that is preceded by a \<div> element. In this case, there can be some other element in between \<div> and \<p>.

- selecting an element through an attribute
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