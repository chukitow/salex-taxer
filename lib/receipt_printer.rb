require_relative './item'

class ReceiptPrinter
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(quantity, name, price, imported)
    item = Item.new(quantity, name, price, imported)
    items << item
  end

  def calculate_totals
    total_sales_tax = 0.0
    total_amount = 0.0

    items.each do |item|
      total_sales_tax += item.sales_tax * item.quantity
      total_amount += item.total_price
    end

    [total_sales_tax, total_amount]
  end

  def print_receipt
    data = []
    total_sales_tax, total_amount = calculate_totals

    items.each do |item|
      item_name = item.name
      if item_name.include?("boxes") && item.quantity > 1
        item_name = item_name.gsub("boxes", "box")
      end

      data <<  "#{item.quantity} #{item_name}: #{'%.2f' % item.total_price}"
    end

    data << "Sales Taxes: #{'%.2f' % total_sales_tax}"
    data << "Total: #{'%.2f' % total_amount}"
  end
end
