require 'spec_helper'
require 'stock_data_cli'

describe StockDataCli::App do
  let(:input_options) { Hash.new }
  
  subject { StockDataCli::App.new.run(input_options) }

  #### Instance Methods

  describe "Initialize" do
    subject { StockDataCli::App.new }

    it { is_expected.to be_instance_of(StockDataCli::App) }

    it "should assign particular variables" do
      expect( subject.quandl_client ).to be_a StockDataCli::QuandlClient
    end
  end

  describe "Run!" do

    context 'when File does not exists' do
      subject { StockDataCli::App.new }
      let(:input_options) { nil }

      it 'should return gracefully with a valid message' do
        expect { subject.run(input_options) }.to output("please provide correct options").to_stdout
      end
    end
  end

end 