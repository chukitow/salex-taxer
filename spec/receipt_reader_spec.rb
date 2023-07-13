require_relative '../lib/receipt_reader'

describe ReceiptReader do
  subject { described_class.new }

  it 'reads the file content from receipt_01' do
    expect(subject.call('receipt_01.txt')).to eq(["2 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"])
  end

  it 'reads the file content from receipt_02' do
    expect(subject.call('receipt_02.txt')).to eq(["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"])
  end

  it 'reads the file content from receipt_03' do
    expect(subject.call('receipt_03.txt')).to eq( ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "3 imported boxes of chocolates at 11.25"])
  end
end