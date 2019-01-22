# Stock Data CLI

A simple application backend which makes it possible to access stock information via command line and offers the option to share the information on another channel like email or Slack.

We are using https://www.quandl.com/ API to fetch stock data for an company. You need Quandl API key to access the stock data, so please signup https://www.quandl.com/ here and then get API key from profile page.

## Installation
`bundle install`

## Usage
## Input
<API_KEY> https://www.quandl.com/ API key to access data.<br />
<stock_symbol> A stock symbol for the company e.g. “AAPL” for Apple Inc.<br />
<start_month> Month of the start date. Like [Jan Feb Mar Apr May June Jul Aug Sep Oct Nov Dec]<br />
<start_day> Date of the start date.<br />
<start_year> Year of the start date in yyyy format e.g. 2018.<br />

End date is optional if you do not pass it will consider start date as end date.<br />

<end_month> Month of the end date. Like [Jan Feb Mar Apr May June Jul Aug Sep Oct Nov Dec]<br />
<end_day> Date of the end date.<br />
<end_year> Year of the end date in yyyy format e.g. 2018.<br />

* clone the repository `git clone git@github.com:sandeep-patle1508/stock_data_cli.git`
* `cd stock_data_cli`

* To pull data for an date range<br />
`/stock.rb  API_KEY=<API_KEY> <stock_symbol> <start_month> <start_date> <start_year> - <end_month> <end_date> <end_year>`

* To pull data for an date<br />
`/stock.rb  API_KEY=<API_KEY> <stock_symbol> <start_month> <start_date> <start_year>`

You can also run these commands by ruby:<br />
`ruby stock.rb  API_KEY=<API_KEY> <stock_symbol> <start_month> <start_date> <start_year>`

##Output

Input​: /stock.rb API_KEY=XXXX AAPL Jan 1 2018 - Jan 5 2018

Output:<br />
02.01.18: Closed at 172.26 (169.26 ~ 172.3)<br />
03.01.18: Closed at 172.23 (171.96 ~ 174.55)<br />
04.01.18: Closed at 173.03 (172.08 ~ 173.47) 05.01.18: Closed at 175.0 (173.05 ~ 175.37)<br />

First 3 Drawdowns:<br />
-1.8% (172.3 on 02.01.18 -> 169.26 on 02.01.18)<br />
-1.5% (174.55 on 03.01.18 -> 171.96 on 03.01.18)<br />
-1.3% (175.37 on 05.01.18 -> 173.05 on 05.01.18)<br />

Maximum drawdown: -1.8% (172.3 on 02.01.18 -> 169.26 on 02.01.18)<br />

Return: 2.740000000000009 [+1.6%] (172.26 on 02.01.18 -> 175.0 on 05.01.18)<br />

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/test` to run the tests. 

## Tools
* Ruby 2.5.1p57
* HTTParty Gem
* Rspec
* webmock