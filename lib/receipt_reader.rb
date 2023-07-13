class ReceiptReader
  def call(file_name)
    file_path = File.join(Dir.pwd, 'receipts', file_name)
    lines = File.readlines(file_path)
    lines.map {|line| line.gsub("\n", '') }
  end
end