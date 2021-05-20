### Scrapy Notes

#### Scrapy Shell Commands

```bash
# Run quick benchmark
scrapy bench
# fetch html markup using scrapy downloader
scrapy fetch url
# Create the new scrapy project
scrapy startproject project_name
"""
Files created after running start_project commans:
1. scrapy.cfg - this file is useful to execute the spider you create; This is
also used to deploy your project at heroku or scrappinghub cloud
2. items.py - This is used to clean the data we scrap and then store the data
in fields
3. middleware.py - There are two type of middleware; one is spider middleware
which is responsible for returning back the data and another is the downloader
middleware which is responsible for downloading the HTML markup of website
4. pipeline.py - This is used to store the item you scrap in the database
5. settings.py - To tweak the setting and configuration of the project
"""
# Create new spider with pre-defined template
scrapy genspider <spider_name>
# run a spider
scrapy crawl <spider_name>
# Outputing spiders result into json file
scrapy crawl <spider name> -o filename.json
# scrapy shell can be started without url, which can be fetched later on using
fetch(url)
# check how spiders see the website, in a browser, pl note that scrapy sees a
# website without javascript; spiders cant acutally render javascript
view(response)
# Note: it is advisable to disbale javascript in browser before finding the
# css selector in chrom inspect toolbox
```

2. Create .py file in the spider subfolder inside project folder
or
Create the boiler plate codes
```bash
scrapy genspider <spider_name>
```

### Legality of scrapping websites.
	1. Use an API if one is provided, instead of scraping data
	2. Respect the terms of service (TOS)
	3. Respect the rules of robots.txt
	4. Use reasonable crawl rate i.e 1 request per 15 seconds
	5. Identify your web scrapper with a legitimate user agent string. create a page
	that explains what you are doing and why and link back to the page in your
	user agent string (e.g. 'MY-BOT(+https://yoursite.com/mybot.html')')
	6. Dont republish scrapped data or any derivate dataset wihtout verifying
	the license of the data or without obtaining a written permission from
	the copyright holder

### robots.txt
	1. Before a search engine visit a site, it checks robots.txt for instructions
	```
	User-agent: *
	Disallow: /
	```
	asterisk after user-agent means that robots.txt file applies to all wev robots
	that visit the site.
	the slash after Disallow to not visit any pages on the site.
	2. Syntax for using the keywords is as follow:
	User-agent: [name of the robot the following rules applies to]
	Disallow: [the URL path you want to block]
	Allow: [the URL path in of a subdirectory, within a blocked parent directory, that
	you want to unblock]

### Dynamic webpage scrapping using splash

1. In case if any tags are visible in the inspect page but are not getting
scrapped in the scrapy shell then the contents might be populated through
javascript. To scrap the dynamic pages, start the scrapy shell without url

```bash
scrapy shell
```
2. then start splash server in docker and render the html version of the dynamic page using following

```bash
fetch("http://localhost:8050/render.html?url=https://www.beerwulf.com/en-gb/c/mixedbeercases")

format:
fetch("http://localhost:8050/render.html?url=url")
```

3. Now you can scrap the data as usual
