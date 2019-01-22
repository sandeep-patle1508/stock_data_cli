require 'spec_helper'
require './lib/stock_data_cli/cli_argv_parser'

describe StockDataCli::CliArgvParser do
  subject { StockDataCli::CliArgvParser.new(argv).parse }

  context "case of valid argv" do
    let(:argv) { ['API_KEY=test_api_key', 'AAPL', 'jan', '01', '2018', '-', 'jan', '05', '2018'] }

    it "should not raise error" do
      expect { subject }.not_to raise_error
    end

    it "should return hash of inputs" do
      is_expected.to include(:api_key, :stock_symbol, :start_date, :end_date)
    end
  end

  context "case of invalid argv" do
    let(:argv) { ['API_KEY=test_api_key', 'AAPL', 'jan', '01'] }

    it "should raise error" do
      expect { subject }.to raise_error 'Wrong number of inputs'
    end
  end
end