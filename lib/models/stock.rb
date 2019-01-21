class Stock
  attr_accessor :date, :open, :high, :low, :close, :dividend, :drawdown

  PERMITTED_ATTRS = [:date, :open, :high, :low, :close, :dividend]

  def initialize(data_hash)
    data_hash.each do |k,v|
      instance_variable_set("@#{k}",v) unless v.nil?
    end
  end

  def set_drawdown
    difference = low - high
    @drawdown = ((difference/high)*100).round(1)
  end
end