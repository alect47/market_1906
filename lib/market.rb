class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(ven)
    @vendors << ven
  end

  def vendor_names
    @vendors.map{ |ven| ven.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all {|ven| ven.check_stock(item) > 0}
  end
end
