require_relative 'receipt_printer'
require_relative 'receipt_reader'

class Taxer
  class << self
    def call(file_name)
      new(file_name).call
    end
  end

  def initialize(file_name)
    @file_name = file_name
  end

  def call
    printer.print_receipt.each do |line|
      puts line
    end
  end

  def raw_results
    printer.print_receipt
  end

  private
  def printer
    printer = ReceiptPrinter.new
    input = ReceiptReader.new.call(@file_name)

    input.each do |item|
      match = item.match(/(\d+) (.+) at (\d+\.\d+)/)
      quantity = match[1].to_i
      name = match[2]
      price = match[3].to_f
      imported = name.include?('imported')

      printer.add_item(quantity, name, price, imported)
    end

    printer
  end
end