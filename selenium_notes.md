### interacting with the page

Given the below html element:
```html
<input type="text" name="passwd" id="passwd-id" />
```
```python
# you can find it using any of following:
element = driver.find_element_by_id('passwd-id')
element = driver.find_element_by_name('passwd')

# if more than one element is found, then the first element will be returned
element = driver.find_element_by_xpath('//input[@id='passwd-id']')

# Entering some text in the text field
element.send_keys('some text')
# Simulating pressing arrow key
element.send_keys('and some', Keys.ARROW_DOWN)

# A side-effect of this is that typing something into a text field wont automatically clear it. instead what you type will be appended to what's already there. you can clear the content of a text field using
element.clear()
```

### Filling in forms
the `<select>` tag is an HTML element which creates a drop-down list on the webpage. This tag also encapsulates a `<option>` tag which defines the items in the list.
```python
element = driver.find_element_by_xpath("//select[@name='name']")
all_options = element.find_element_by_tag_name("option")
for option in all_options:
    print("Value is: %s" % option.get_attribute("value"))
    option.click()
# However the above method is not very efficient. webdriver support class includes one called a `Select` which provides useful methods for interacting with these:
from selenium.webdriver.support.ui import Select
select = Select(driver.find_element_by_name('name'))
select.select_by_index(index)
select.select_by_visible_text('text')
select.select_by_value(value)
select.deselect_all()

# to get all available options
options = select.options

# when you call submit on an element within a form, Webdriver will walk up the DOM until it finds the enclosing form and then call submit on that
element.submit()