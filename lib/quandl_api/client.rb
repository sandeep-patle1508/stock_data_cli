# reference for API - https://www.quandl.com/data/EOD-End-of-Day-US-Stock-Prices/usage/quickstart/api
require 'httparty'
require 'json'

module QuandlApi
  class Client
    include HTTParty

    # API base URL for EOD database
    base_uri 'https://www.quandl.com/api/v3/datasets/EOD'.freeze

    def initialize(options)
      @stock_symbol = options[:stock_symbol]
      @options = { query: { api_key: options[:api_key], start_date: options[:start_date], end_date: options[:end_date]} }
    end

    def get_stock
      self.class.get("/#{@stock_symbol}", @options)
    rescue HTTParty::Error => e
      abort e.message
    end
  end
end