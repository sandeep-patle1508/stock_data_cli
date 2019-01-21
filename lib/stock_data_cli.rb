Dir.glob('./lib/stock_data_cli/**/*.rb').each do |file|
  require file
end
