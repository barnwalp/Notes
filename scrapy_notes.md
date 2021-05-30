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
# Outputing spiders result into different file format
scrapy crawl <spider name> -o filename.json
scrapy crawl <spider name> -o filename.csv
scrapy crawl <spider name> -o filename.xml
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

### When to not use web scrapping


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

### Debugging Scrapy Spider
parse command allows to chekc the behavior of different parts of the spider at
the method level

```bash
scrapy parse --spider=<spider_name> -c <parse_method> url
# example
scrapy parse --spider=countries -c parse_countries https://www.worldometers.info/world-population/china-population/
# one can also pass the argument like meta through the command line
scrapy parse --spider=countries -c parse_countries --meta={\"country_name\":\"China\"} https://www.worldometers.info/world-population/china-population/
```

### Where is web scrapping used:
1. Lead generation
2. Real estate listing
3. Price Monitoring
4. Stock market tracking
5. Drop shipping

### Scrapy genspider template
There are 4 available template in scrapy. By default, it uses basic template
1. basic
2. crawl
3. csvfeed
4. xmlfeed

To use any other template use
```bash
scrapy genspider -t crawl <spider_name>
```

### Scrapping javascript enabled webpages
scrapy does not have built-in engine that can interpret javascript
In such scenario, we can either use splash or selenium; splash is a
lightweight browser which uses apple-webkit engine same as safari similar
to as Google Chrome uses V-8 engine

### Docker and splash
```bash
# Installing splash
sudo docker pull scrapinghub/splash

# Launching splash
sudo docker run -it -p 8050:8050 scrapinghub/splash

# Check in browser if splash is running 
http://localhost:8050
```

### Splash and lua programming language
As there are no icon on splash; you interact with browser through code
```lua
function main(splash, args)
  -- get the url from the input box
  url = args.url

  -- open the url in the browser
  --assert will handle the error if found any while opening the link
  assert(splash:go(url))

  -- it is advisable to wait for 1 second for page to open
  assert(splash:wait(1))

  -- select the input box
  input_box = assert(splash:select("#search_form_input_homepage"))

  -- you can only write value in focus state
  input_box:focus()

  --send text
  input_box:send_text("my user agent")
  assert(splash:wait(1))

  -- select search button
  btn = assert(splash:select("#search_button_homepage"))
  btn:mouse_click()

  -- can also be done in one line
  input_box:send_keys("<Enter>")
  assert(splash:wait(2))

  -- return the response as a snapshot
  --return splash:png()
  -- return the response as a snapshot
  --return splash:html()
 
  -- get the full page in png
  splash:set_viewport_full()
  -- creating object in lua
  return {
    image = splash:png(),
    html= splash:html()
  }
end
```
