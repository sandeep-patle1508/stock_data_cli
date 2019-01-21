require 'spec_helper'
require 'stock_data_cli'

describe 'stock data cli command' do
  subject { StockDataCli::App.new.run({}) }

  it "should run and initiated stock data cli" do
    expect( subject ).to_not be false
  end
end