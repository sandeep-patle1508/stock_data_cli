class Stock
 
  PERMITTED_ATTRS = [:date, :open, :high, :low, :close, :dividend]

  def initialize(data_hash)
    data_hash.each do |k,v|
      instance_variable_set("@#{k}",v) unless v.nil?
    end
  end
end