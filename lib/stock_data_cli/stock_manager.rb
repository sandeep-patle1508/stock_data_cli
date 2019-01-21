require './lib/quandl_api/client'

module StockDataCli
	class StockManager
		def initialize(options)
			@quandl_client = QuandlApi::Client.new(options)
		end

		def print_data
			response = @quandl_client.get_stock

			puts response.inspect
		end
	end
end

