### Scrapy Notes

#### Response.css syntax
1. To get the title with the selector
```python
response.css('title')
```
2. To get only the title tag
```python
response.css('title').get()
```
3. To get the title text from the html tag
```python
response.css('title::text').get()
```
4. To get all h3 tags
```python
response.css('h3::text').get
```
5. To get the first h3 text
```python
response.css('h3::text').get()
```
6. To get the second h3 text
```python
response.css('h3::text')[1].get()
```
7. To get all h3 texts
```python
response.css('h3:text').getall()
```
8. To get complete content inside h3 tag
```python
response.css('h3').get()
```
9. To get the tag using class
```python
response.css('.post-header').get()
```
10. To get the anchor tag inside the mentioned class
```python
response.css('.post-header a').get()
```
11. To get the text of the anchor tag inside the mentioned class
```python
response.css('.post-header a::text').get()
```
12. To get the second text of the anchor tag inside the mentioned class
```python
response.css('.post-header a::text')[1].get()
```
13. To get all the anchor text inside a class
```python
response.css('.post-header a::text').getall()
```
14. Using regex to find the matching text
```python
response.css('p::text').re(r'scraping')
```
14. Get the data by looping through tags inside a class
```python
for post in response.css('div.post-item'):
	title = post.css('.post-header h2 a::text')[0].get()
	date = post.css('.post-header a::text')[1].get()
	title = post.css('.post-header a::text')[2].get()
	print(dict(title=title, date=date, author=author))

```

#### Scrapy Shell Commands

1. Crawl a website url in the scrapy shell
```bash
scrapy shell [url]
```

2. Start crawling a spider using its name
```bash
scrapy crawl <spider name>
```

3. Outputing spiders result into json file
```bash
scrapy crawl <spider name> -o filename.json
```

### Starting scrapy project

1. Create the new scrapy project
```bash
scrapy startproject project_name
```

2. Create .py file in the spider subfolder inside project folder

### Running server with docker as per scrapy book
1. git clone https://github.com/scalingexcellence/scrapybook.git
2. cd into scrapybook directory
3. run `docker-compose pull` - to check for updated images
4. `docker-compose up` - will scroll log messages as various containers start up
5. Ctrl + C - To stop the container

to open the server from the google chrome, open
http://localhost:9312/

