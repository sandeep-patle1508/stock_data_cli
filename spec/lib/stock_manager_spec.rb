require 'spec_helper'
require './lib/stock_data_cli/stock_manager'

describe StockDataCli::StockManager do
  let(:options) { { api_key: 'test_api_key', stock_symbol: 'AAPL', start_date: '2018-01-01', end_date: '2018-01-05' } }

  describe "Initialize" do
    subject { StockDataCli::StockManager.new(options) }

    it { is_expected.to be_instance_of(StockDataCli::StockManager) }

    it "should assign particular variables" do
      expect( subject.quandl_client ).to be_a QuandlApi::Client
    end
  end

  describe "PrintData" do
    it 'queries FactoryGirl contributors on Github' do
      uri = URI('https://www.quandl.com/api/v3/datasets/EOD')
      response = Net::HTTP.get(uri)
      expect(response).to be_an_instance_of(String)
    end
  end
end