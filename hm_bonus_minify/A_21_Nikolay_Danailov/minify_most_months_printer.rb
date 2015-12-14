require 'rexml/document'
require_relative 'minify_printer.rb'

class MinifyMostMonthsPrinter < MinifyPrinter
  def self.get_month_data(csv)months = []
    i = 0
    while i < csv.size
      date = csv[i][DATE_COLUMN].split '/'
      month = "#{date[1]}/#{date[2]}"
      current_month = month
      gain = 0
      expense = 0

      while current_month == month && i < csv.size
        value = csv[i][AMOUNT_COLUMN].to_f

        if value > 0
          gain += value
        elsif value < 0
          expense += value
        end

        i += 1

        if i < csv.size
          date = csv[i][DATE_COLUMN].split '/'
          month = "#{date[1]}/#{date[2]}" if i < csv.size
        end
      end

      months << [current_month, gain, expense]
    end

    months
  end

  def self.print_most_months(csv, months)
    csv.sort_by! do |row|
      date = row[DATE_COLUMN].split('/').map(&:to_i)
      [date[2], date[1]]
    end

    months = get_month_data csv
    print_csv months
  end
end