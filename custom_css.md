## Custom CSS Selector

- CSS operators
    - \> Child
        It will return the li which are direct child of ul and will
        not return the lis present inside the li of ul
        `ul#categories>li`
    - \+ Adjacent
        ` div + p`
    - \~ Sibling
        ` div ~ p`

- selecting an element through an attribute
    `response.css('[itemprop="author"]::text').get()`

    `input[id='username']`	--- css with one attribute
    `input[id='username'][type='email']`	--- css with two attribute

- it will select tags whose id contains either user or name
    `input[id*='user']`
    `input[id*='name']`

- starting the text in css
    `input[id^='user']`

- ending the text in css
    `input[id$='name']`

- comma in css does union of the tags through css selector
    `div.private-form_input-wrapper, input#username`

- first-of-type in css:
    `ul#categories>li:first-of-type`

- last-of-type in css:
    `ul#categories > li:last-of-type`

- nth-of-type in css:
    `ul#categories>li:nth-of-type(3)` --- will get the 3rd li
    `ul#categories>li:nth-of-type(n)` --- will return all elements

- sibling of element in css:
    `div.private-form_input-wrapper+div` --- elements on either side of + are siblings
    `ul#categories>li:nth-of-type(3)+li` --- it will select the immediate next li

- not operator in css:
    `input.form-control.private-form_control:not(.login-password)`
