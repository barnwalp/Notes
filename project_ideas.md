### Website with django and python for data science
“The project consists of creating a page with the Flask framework in order to let the user analyze textual data.

The idea is to let the user upload their dataset (in format like CSV, TSV, etc.)

After that have some options to customize the upload (choosing the separator, header existing or not, strings are quoted or not, etc…).

Once the dataset is loaded the user can choose the type for each column (numerical data, strings, etc.).

After that, the user selects the columns containing the verbatims and click on an analyze button.

The data is then pushed to the backend where I’ll have python scripts to do text classification and other Machine learning models that I’ve developed.”

### Build a script/program to get quote in real time from other websites

“I need a script/program that enters user data on other sites in real-time in order to get a quote.

Here is a use case:

A user is on my website looking for renter’s insurance and enters in their personal details.

Once they enter their personal details, this program/script enters those details on 5 other websites of insurance companies and pulls back the price quote from each.”

Tip: first find a few insurance comparison sites and learn how to access them via an API. Decide on the type of user input that is common to all sites (e.g. the age of the user). Now, write a script that takes the user input and asks all insurance comparison sites about a quote for the user.

### Build an application for a website for selecting a security camera

“Build an app that selected a security camera based on features the customer wants.

For example: Do you want night vision? Yes/No, Do you want Panning, Tilting, Zooming? Y/N

The customer will answer a series of questions and the app will suggest 1-2 cameras that best fit their needs.

Prefer to be coded in Python.“

Tip: Select the cameras first from Amazon. Then, write down different features of these cameras. Based on your data, come up with different questions. Now, write a Python script that iteratively restricts the set of user restrictions by asking the user one question after another.

### Football predictions bot

“I am addressing this project to people who have already build such a bot and can show me results of their work.

What I am looking to receive is a bot that collects historical data from at least 2 sources and to be able to make predictions for today, tomorrow and this week regarding upcoming matches.

I want to have the ability to set the odds (1.1 to 1.5, >1.5 to 1.8, higher than 1.8) and the bet types (Double Chance, 1×2, Under / Over 1.5, Under / Over 2.5, Both Team Score).

I want to have the results sorted by the highest change of winning. I need to results displayed on a web page. I will provide a VPS that will host the project (if you can recommend a VPS provider that you have used for past projects – I will use it).

This is the first part of the project. After I test the accuracy of the predictions – I will decide if we move ahead into the next phase with more features.

Tip: you don’t need to host the project anywhere — just do it on your local PC. It’s all about making prediction of football games based on some data sets which you find online (e.g. the rankings of the teams playing against each other).

### Using youtube API to find audience demographics

“I’m quite a novice at this sort of stuff so ideally, I’d like to be able to find the audience demographics of a certain youtube channel and import onto a google sheet. Similar to what Tubular does.”

Tip: This project is about accessing the Youtube API to get statistics about Youtube channels. To increase the difficulty level a bit, you can let the user type in different Youtube channels and you output a sorted list of channels with respect to their size (number of subscribers).

### Build and automatic email responder

“We need something coded in Python 3 that will take emails sent to a certain email, read certain of pieces from that email and send out that data to another email.”

Tip: Crawl each email you receive for email addresses and website addresses. Then visit the websites and crawl them for email addresses, too. Send a reply email to all found email addresses with a pre-defined text. Use dummy email addresses — e.g. throw away email addresses — to test your script.

### Web scrapper

“I need somebody to scrap a website for me: image, price, inventory, size, description. I want to import it to Shopify and I want it to be monitored so that when the prices or inventory changes in the original website I want it to automatically update in my website.”

Tip: Simply select a Shopify website to monitor. Then create a script with an infinite while loop which repeatedly pulls the content of the website, checks whether anything changes, and waits for a pre-defined time interval.

### A website for financial stock market using python

“Create a website using Python Django/Flask.

Data should be pulled into MySQL database everyday from Yahoo/Google finance.

The website should display graphs and users should be given options to search for stock prices.”

Tip: This is an interesting project. Implement it with a minimalists mindset: add only the requested features. Nothing more.

### Deep deterministic policy gradients for robotic manipulations: reinforcement learning

“Input: Image [48×48] High dimensional data

Output: [x, y, z, g]

x,y,z are coordinates

g: 0 -180 degrees

Predict the output values using DDPG for an application

Reference: https://arxiv.org/pdf/1509.02971.pdf“

Tip: Fortunately, the client provides a link to the research paper https://arxiv.org/pdf/1509.02971.pdf . Read the paper and all the background you need to be able to implement this project. This is very advanced but if you manage to solve this project, you know that you are a machine learning master
