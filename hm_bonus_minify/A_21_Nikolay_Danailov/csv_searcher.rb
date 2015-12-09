require 'csv'

# Searches for data in the passed csv
class CSVSearcher
  DATE_COLUMN = 0
  VALUE_COLUMN = 3

  def self.get_date_output(csv_filename, date, value = nil)
    output = []

    CSV.foreach(csv_filename) do |row|
      output << row if wanted_row? row, date, value
    end
    
    output
  end

  private

  def self.wanted_row?(row, wanted_date, wanted_value)
    result = row[DATE_COLUMN] == wanted_date
    row_value = row[VALUE_COLUMN].to_f

    return result if wanted_value.nil?

    result && (row_value < wanted_value + 10 && row_value > wanted_value - 10)
  end
end
