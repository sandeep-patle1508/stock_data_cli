require './lib/quandl_api/client'
require './lib/models/stock'

module StockDataCli
  class StockManager

    def initialize(options)
      @quandl_client = QuandlApi::Client.new(options)
    end

    def print_data
      response = @quandl_client.get_stock
      abort 'Unable to find data for this search' if response['dataset'].nil? || response['dataset'].empty?
      data_hash = parse_response(response)

      puts data_hash.inspect
    end


    def parse_response(response)
      stocks = []
      column_names = response['dataset']['column_names']

      response['dataset']['data'].each do |row|
        stocks << Stock.new(associate_with_columns(column_names, row))
      end

      stocks
    end

    def associate_with_columns(columns, row)
      data_hash = {}

      columns.each_with_index do |c, i|
        column_symbol = c.downcase.to_sym
        data_hash[column_symbol] = row[i] if Stock::PERMITTED_ATTRS.include?(column_symbol)
      end

      data_hash
    end
  end
end

