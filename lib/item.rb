class Item
  attr_accessor :quantity, :name, :price, :imported

  def initialize(quantity, name, price, imported)
    @quantity = quantity
    @name = name
    @price = price
    @imported = imported
  end

  def sales_tax
    tax = 0.0
    tax += price * 0.1 unless exempted_from_sales_tax?
    tax += price * 0.05 if imported
    round_up_to_nearest_0_05(tax)
  end

  def total_price
    (price + sales_tax) * quantity
  end

  private

  def exempted_from_sales_tax?
    name.include?('book') || name.include?('chocolate') || name.include?('pills')
  end

  def round_up_to_nearest_0_05(value)
    (value * 20).ceil / 20.0
  end
end