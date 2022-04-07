require_relative "ownable"

class Item
  include Ownable
  attr_reader :name, :price

  @@instances = []

  def initialize(name, price, owner=nil)
    @name = name
    @price = price
    self.owner = owner

    @@instances << self
  end

  def label
    { name: name, price: price }
  end

  def self.all
    @@instances
  end

end