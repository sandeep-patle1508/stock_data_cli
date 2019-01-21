module StockDataCli
  class App
    def run(argv)
      options = StockDataCli::CliArgvParser.new(argv).parse
      StockDataCli::StockManager.new(options).print_data
    end
  end
end