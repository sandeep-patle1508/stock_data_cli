module StockDataCli
  class App
    def run(argv)
      options = StockDataCli::CliArgvParser.new(argv).parse

      unless options.empty?
        puts options.inspect
      end
    end
  end
end