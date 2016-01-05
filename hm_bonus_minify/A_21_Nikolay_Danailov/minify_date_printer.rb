require 'csv'
require 'net/http'
require 'openssl'
require 'sanitize'
require_relative 'minify_printer.rb'

class MinifyDatePrinter < MinifyPrinter

  def self.print_date_output(csv, date, value = nil)
    output = []

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