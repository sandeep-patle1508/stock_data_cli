require './lib/quandl_api/client'
require './lib/models/stock'
require './lib/stock_data_cli/stock_helper'

module StockDataCli
  class StockManager
    include StockHelper

    # initialize QuandApi client
    def initialize(options)
      @quandl_client = QuandlApi::Client.new(options)
      @stocks = []
      @sorted_stocks = []
    end

    # make GET call to fetch the data
    # prepare result for display
    # display result 
    def print_data
      response = @quandl_client.get_stock
      abort 'Unable to find data for this search' if response['dataset'].nil? || response['dataset'].empty?

      prepare_result(response)
      display_result
    end

    private
    # prepare array of stock objects
    # sort the stocks by drawdown desc order
    def prepare_result(response)
      stocks = []
      column_names = response['dataset']['column_names']

      response['dataset']['data'].each do |row|
        stock = Stock.new(associate_with_columns(column_names, row))
        stock.set_drawdown
        @stocks << stock
      end
      @stocks.reverse!
      @sorted_stocks = @stocks.sort { |a, b|  a.drawdown <=> b.drawdown }
    end
  end
end

