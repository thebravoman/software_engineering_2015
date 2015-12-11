require 'csv'

# Searches for data in the passed csv
class CSVSearcher
  DATE_COLUMN = 0
  ACCOUNT_COLUMN = 1
  VALUE_COLUMN = 3

  def self.print_date_output(csv_filename, date, value = nil)
    output = []
    csv = CSV.read(csv_filename)[1..-1]

    csv.each do |row|
      wanted = row[DATE_COLUMN] == date
      row_value = row[VALUE_COLUMN].to_f

      unless value.nil?
        wanted &&= row_value < value + 10 && row_value > value - 10
      end

      output << row if wanted
    end
    
    print_csv output
  end

  def self.print_account_output(csv_filename, account)
    output = []
    sum = 0.0
    csv = CSV.read(csv_filename)[1..-1]

    csv.each do |row|
      if row[ACCOUNT_COLUMN] == account
        output << row
        sum += row[VALUE_COLUMN].to_f
      end
    end

    print_csv output
    puts sum.round 2
  end

  def self.print_csv(csv)
    csv.each do |row|
      puts row.join ','
    end
  end
end
