require_relative '../lib/receipt_printer'

describe ReceiptPrinter do
  describe '#calculate_totals' do
    let(:receipt) { described_class.new }

    context 'when the receipt has no items' do
      it 'returns 0 for sales taxes and total amount' do
        sales_taxes, total_amount = receipt.calculate_totals
        expect(sales_taxes).to eq(0)
        expect(total_amount).to eq(0)
      end
    end

    context 'when the receipt has multiple items' do
      before do
        receipt.add_item(2, 'book', 12.49, false)
        receipt.add_item(1, 'music CD', 14.99, false)
        receipt.add_item(1, 'chocolate bar', 0.85, false)
      end

      it 'returns the correct sales taxes and total amount' do
        sales_taxes, total_amount = receipt.calculate_totals
        expect(sales_taxes).to eq(1.5)
        expect(total_amount).to eq(42.32)
      end
    end
  end

  describe '#print_receipt' do
    let(:receipt) { described_class.new }

    before do
      receipt.add_item(2, 'book', 12.49, false)
      receipt.add_item(1, 'music CD', 14.99, false)
      receipt.add_item(1, 'chocolate bar', 0.85, false)
    end

    it 'prints the receipt details in the correct format' do
      expected_output = [
        "2 book: 24.98",
        "1 music CD: 16.49",
        "1 chocolate bar: 0.85",
        "Sales Taxes: 1.50",
        "Total: 42.32",
      ]

      expect(receipt.print_receipt).to eq(expected_output)
    end
  end
end