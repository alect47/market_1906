class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.keys.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, num)
    if !@inventory.keys.include?(item)
      @inventory[item] = num
    else
      @inventory[item] += num
    end
  end


end
