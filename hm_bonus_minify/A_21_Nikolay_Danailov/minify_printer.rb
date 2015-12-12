class MinifyPrinter
  DATE_COLUMN = 0
  ACCOUNT_COLUMN = 1
  AMOUNT_COLUMN = 3
  DESCRIPTION_COLUMN = 5

  def self.print_xml(xml)
    formatter = REXML::Formatters::Pretty.new
    formatter.write(xml, $stdout)
  end

  def self.print_csv(csv)
    csv.each do |row|
      puts row.join ','
    end
  end
end