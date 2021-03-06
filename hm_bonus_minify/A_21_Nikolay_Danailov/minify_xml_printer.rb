require 'rexml/document'
require_relative 'minify_printer.rb'

class MinifyXMLPrinter < MinifyPrinter
  def self.make_account_elements(csv, minify_el)
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

          while current_acc == account && current_date == date && i < csv.size
            amount = row[AMOUNT_COLUMN]
            amount_el = date_el.add_element('amount')
            amount_el.add_text amount

            i += 1
            row = csv[i]

            if i < csv.size
              date = row[DATE_COLUMN]
              account = row[ACCOUNT_COLUMN]
            end
          end
        end

        # change the row and account before the loop checks
        row = csv[i]
        account = csv[i][ACCOUNT_COLUMN] if i < csv.size
      end
    end
  end

  def self.generate_xml(csv)
    xml = REXML::Document.new
    minify_el = xml.add_element 'minify'
    make_account_elements csv, minify_el
    xml
  end

  def self.print_to_xml(csv)
    csv.sort_by! do |row| 
      date = row[DATE_COLUMN].split '/'
      [row[ACCOUNT_COLUMN], date[2].to_i, date[1].to_i, date[0].to_i, row[AMOUNT_COLUMN].to_i]
    end

    xml = generate_xml csv
    print_csv csv
    print_xml xml
  end
end