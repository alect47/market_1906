require 'pry'

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

  def sorted_item_list
    @vendors.map {|ven| ven.inventory.keys}
      .flatten.uniq.sort
  end

  def total_inventory
    hash = Hash.new(0)
    @vendors.each do |ven|
      sorted_item_list.each do |item|
        if ven.inventory[item] != nil
          hash[item] += ven.inventory[item]
        end
      end
    end
    hash
  end

  def sell(item, num)
    if total_inventory[item] < num
      false
    else
      vendors_that_sell(item).map do |ven|
          if ven.inventory[item] > num
            ven.inventory[item] -= num
          else
            a = ((ven.inventory[item] - num) * -1)
            ven.inventory[item] -= ((ven.inventory[item] - num) + num)
            num = a
          end
      end
      true
    end
  end

end
