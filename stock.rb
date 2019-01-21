#!/usr/bin/env ruby
begin  
  require './lib/stock_data_cli'
 rescue LoadError => e
   abort "Could not load 'stock_data_cli'"
 end

StockDataCli::App.new.run ARGV
