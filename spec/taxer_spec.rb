require_relative '../lib/taxer'

describe Taxer do
  it 'prints sales tax receipts_01.txt' do
    expected_output = <<~OUTPUT
      2 book: 24.98
      1 music CD: 16.49
      1 chocolate bar: 0.85
      Sales Taxes: 1.50
      Total: 42.32
    OUTPUT

    expect { described_class.call('receipt_01.txt') }.to output(expected_output).to_stdout
  end

  it 'prints sales tax receipts_02.txt' do
    expected_output = <<~OUTPUT
      1 imported box of chocolates: 10.50
      1 imported bottle of perfume: 54.65
      Sales Taxes: 7.65
      Total: 65.15
    OUTPUT

    expect { described_class.call('receipt_02.txt') }.to output(expected_output).to_stdout
  end

  it 'prints sales tax receipts_03.txt' do
    expected_output = <<~OUTPUT
      1 imported bottle of perfume: 32.19
      1 bottle of perfume: 20.89
      1 packet of headache pills: 9.75
      3 imported box of chocolates: 35.55
      Sales Taxes: 7.90
      Total: 98.38
    OUTPUT

    expect { described_class.call('receipt_03.txt') }.to output(expected_output).to_stdout
  end
end