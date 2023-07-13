require_relative '../lib/item'

describe Item do
  describe '#sales_tax' do
    context 'when item is exempted from sales tax' do
      let(:item) { described_class.new(1, 'book', 12.49, false) }

      it 'returns sales tax as 0' do
        expect(item.sales_tax).to eq(0)
      end
    end

    context 'when item is not exempted from sales tax' do
      let(:item) { described_class.new(1, 'music CD', 14.99, false) }

      it 'returns the correct sales tax' do
        expect(item.sales_tax).to eq(1.5)
      end
    end

    context 'when item is imported and exempted from sales tax' do
      let(:item) { described_class.new(1, 'imported box of chocolates', 10.0, true) }

      it 'returns the correct sales tax' do
        expect(item.sales_tax).to eq(0.5)
      end
    end

    context 'when item is imported and not exempted from sales tax' do
      let(:item) { described_class.new(1, 'imported bottle of perfume', 47.50, true) }

      it 'returns the correct sales tax' do
        expect(item.sales_tax).to eq(7.15)
      end
    end
  end

  describe '#total_price' do
    let(:item) { Item.new(2, 'book', 12.49, false) }

    it 'returns the correct total price' do
      expect(item.total_price).to eq(24.98)
    end
  end
end