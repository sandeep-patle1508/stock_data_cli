class Stock
  attr_accessor :date, :open, :high, :low, :close, :drawdown

  PERMITTED_ATTRS = [:date, :open, :high, :low, :close,]

  def initialize(data_hash)
    data_hash.each do |k,v|
      instance_variable_set("@#{k}",v) unless v.nil?
    end
  end

  def set_drawdown
    difference = low - high
    @drawdown = ((difference/high)*100).round(1)
  end

  def stock_string
    "#{date}: Closed at #{close} (#{low} ~ #{high})"
  end

  def drawdown_string
    "#{drawdown}% (#{high} on #{date} -> #{low} on #{date})"
  end
end