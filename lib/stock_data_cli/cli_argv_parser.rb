require 'date'

module StockDataCli
  class CliArgvParser

    def initialize(argv)
      @argv = argv
    end

    def parse
      validate_count_of_argv
      {
        api_key: parse_api_key,
        stock_symbol: parse_stock_symbol,
        start_date: parse_start_date,
        end_date: parse_end_date
      }
    end

    private
    def validate_count_of_argv
      abort 'Wrong number of inputs' unless @argv.size == 5 or (@argv.size == 9 && @argv[5] == '-')
    end

    def parse_api_key
      api_key = @argv[0]

      if api_key.include?('API_KEY')
        api_key = api_key.split('=').last 
        abort 'Please enter valid api key' if api_key.nil?
      else
        abort 'Please enter api key' if api_key.nil?
      end
      api_key
    end

    def parse_stock_symbol
      @argv[1].upcase
    end

    def parse_start_date
      Date.strptime("#{@argv[2]} #{@argv[3]} #{@argv[4]}", "%b %d %Y").to_s
    rescue => e
      puts e.message
      abort 'Please enter vallid start date'
    end

    def parse_end_date
      if @argv.size == 9
        begin
          Date.strptime("#{@argv[6]} #{@argv[7]} #{@argv[8]}", "%b %d %Y").to_s
        rescue
          abort 'Please enter vallid end date'
        end
      else
        parse_start_date
      end
    end
  end
end