require 'csv'
require_relative 'minify_printer.rb'

class MinifyDatePrinter < MinifyPrinter
  def self.print_date_output(csv_filename, date, value = nil)
    output = []
    csv = CSV.read(csv_filename)[1..-1]

    csv.each do |row|
      wanted = row[DATE_COLUMN] == date
      row_value = row[AMOUNT_COLUMN].to_f

      unless value.nil?
        wanted &&= row_value < value + 10 && row_value > value - 10
      end

      output << row if wanted
    end
    
    print_csv output
  end
end