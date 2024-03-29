module StockHelper
  # use API response column name to find the order of data
  # only export/store required column
  def associate_with_columns(columns, row)
    data_hash = {}

    columns.each_with_index do |c, i|
      column_symbol = c.downcase.to_sym
      data_hash[column_symbol] = row[i] if Stock::PERMITTED_ATTRS.include?(column_symbol)
    end

    data_hash
  end

  # print result
  def display_result
    @stocks.each { |stock| puts stock.stock_string }
    display_first_3_drawdown
    display_max_drawdown
    display_return(@stocks.first, @stocks.last)
  end

  def display_first_3_drawdown
    puts "\nFirst 3 Drawdowns:\n"
    @sorted_stocks[0..2].each { |stock| puts stock.drawdown_string }
  end

  def display_max_drawdown
    puts "\nMaximum drawdown: #{@sorted_stocks.first.drawdown_string}"
  end

  def display_return(first_stock, last_stock)
    difference = last_stock.close - first_stock.close 
    drawdown = ((difference/first_stock.close)*100).round(1)

    value_sign = drawdown > 0 ? '+' : '-'
    puts "\n Return: #{difference} [#{value_sign}#{drawdown}%] (#{first_stock.close} on #{first_stock.date} -> #{last_stock.close} on #{last_stock.date})"
  end
end