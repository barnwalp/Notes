## Custom CSS Selector

1. id --> htmltag#id, #id
2. class --> htmltag.classname, .classname, .c1.c2.c3, htmltag.c1.c2...cn
3. parent>childtag

`ul#categories>li` will return the li which are direct child of ul and will
not return the lis present inside the li of ul

you may use both of these as id is always unique, so `#username` is also enough
ul# categories == #username

This will select the input tag of class = `"form-control private-form_control login-email"`
`input.form-control.private-form_control.login-email`
`input#username.form-control.private-form_control.login-email`
`.form-control.private-form_control.login-email`
`input.login-email`

4. htmltag[id='value']
`input[id='username']`	--- css with one attribute
`input[id='username'][type='email']`	--- css with two attribute

5. contains the text in css

it will select tags whose id contains either user or name
`input[id*='user']
input[id*='name']`

6. starting the text in css
`input[id^='user']`

7. ending the text in css
`input[id$='name']`

8. comma in css basically does union of the tags through css selector
`div.private-form_input-wrapper, input#username`

9. first-of-type in css:
`ul#categories>li:first-of-type`

10. last-of-type in css:
`ul#categories>li:last-of-type`

11. nth-of-type in css:
`ul#categories>li:nth-of-type(3)` --- will get the 3rd li
`ul#categories>li:nth-of-type(n)` --- will return all elements

12. sibling of element in css:
`div.private-form_input-wrapper+div` --- elements on either side of + are siblings
`ul#categories>li:nth-of-type(3)+li` --- it will select the immediate next li

13. not operator in css:
`input.form-control.private-form_control:not(.login-password)`
