### Xpath Expression

- Basic format of Xpath 
xpath = //tagname[@Attribute='value']
example = ```xpath = //input[@name='uid']```

- selecting an element inside of a class using text 
```//*[@class='featured-box cloumnsize1']//*[text()='Testing']```

- contains method in xpath
```xpath = //*[contains(@type, 'sub')]```

- Using OR and AND operation
```xpath = //*[@type='submit' or @name='btnReset']```
```xpath = //*[@type='submit' or contains(@name,  'btnLogin']```

- starts-with method in xpath
```xpath = //*[starts-with(@id, 'message')]```

- text() function
```xpath = //td[text()='UserID']```

- axes method - used to find the complex or dynamic elements
    - selecting all input elements after element with attribute having text value  
    ```xpath=//*[@type='text']//following::input```
    - selecting particular elements
    ```xpath=//*[@type='text']//following::input[1]```
    - selecting ancestor elements of the current node
    ```xpath=//*[@text()='Enterprise Testing']//ancestor::div```
    - select all children elements of the current node
    ```xpath=//*[@id='java_technologies']//child::li```
    - select all nodes that come before the current node
    ```xpath=//*[@type='submit']//preceding::input```
    - selecting sibling of the conext node. siblings are at the same level of the current node.
    ```xpath=//*[@type='submit']//following-sibling::input```
    - select parent of the current node
    ```xpath=//*[@id='rt-feature']//parent::div```
    - select the descendants of the current node
    ```xpath=//*[@id='rt-feature']//descendant::a```
