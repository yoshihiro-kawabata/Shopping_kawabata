require_relative "item_manager"
require_relative "ownable"

class Cart
  include ItemManager
  include Ownable

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    @items
  end

  def add(item)
    @items << item
  end

  def total_amount
    @items.sum(&:price)
  end

  def check_out
    return if owner.wallet.balance < total_amount
  
    @owner.wallet.withdraw(total_amount)
    @items[0].owner.wallet.deposit(total_amount)
 
    customer = self.owner
    @items.map do |item|
      item.owner = customer
    end

    @items.clear()

  end

end
