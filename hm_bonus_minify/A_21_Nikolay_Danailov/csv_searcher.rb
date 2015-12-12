require 'csv'
require 'rexml/document'

# Searches for data in the passed csv
class CSVSearcher
  DATE_COLUMN = 0
  ACCOUNT_COLUMN = 1
  AMOUNT_COLUMN = 3
  DESCRIPTION_COLUMN = 5

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

  def self.print_account_output(csv_filename, account)
    output = []
    sum = 0.0
    csv = CSV.read(csv_filename)[1..-1]

    csv.each do |row|
      if row[ACCOUNT_COLUMN] == account
        output << row
        sum += row[AMOUNT_COLUMN].to_f
      end
    end

    output.sort_by! do |row| 
      date = row[DATE_COLUMN].split '/'
      [date[2].to_i, date[1].to_i, date[0].to_i]
    end

    print_csv output
    puts sum.round 2 if output.size > 0
  end

  def self.print_to_xml(csv_filename)
    csv = CSV.read(csv_filename)[1..-1]

    csv.sort_by! do |row| 
      date = row[DATE_COLUMN].split '/'
      [row[ACCOUNT_COLUMN], date[2].to_i, date[1].to_i, date[0].to_i, row[AMOUNT_COLUMN].to_i]
    end

    xml = REXML::Document.new
    minify_el = xml.add_element 'minify'

    current_acc = ''
    i = 0

    while i < csv.size
      row = csv[i]
      account = row[ACCOUNT_COLUMN]

      account_el = minify_el.add_element 'account'
      account_el.add_attribute 'name', account
      current_acc = account
      current_date = ''

      while current_acc == account && i < csv.size
        date = row[DATE_COLUMN]

        if date != current_date
          date_el = account_el.add_element 'date'
          date_el.add_attribute 'value', date
          current_date = date
          row = csv[i]

          while current_date == date && i < csv.size
            amount = row[AMOUNT_COLUMN]
            amount_el = date_el.add_element('amount')
            amount_el.add_text amount

            i += 1
            row = csv[i]
            date = row[DATE_COLUMN] if i < csv.size
          end
        end

        # change the row and account before the loop checks
        row = csv[i]
        account = csv[i][ACCOUNT_COLUMN] if i < csv.size
      end
    end

    print_csv csv
    print_xml xml
  end

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
