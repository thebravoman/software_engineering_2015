require_relative 'printer.rb'
require 'rexml/document'

class XMLPrinter < Printer

    def self.add_account_elements csv, xml
        account_name = ''
        current_date = ''
        account_element = nil
        date_element = nil
        csv.each do |row|
            previous_account_name = account_name
            previous_date = current_date
            account_name = row[ACCOUNT_COLUMN]
            current_date = row[DATE_COLUMN]
            if account_name != previous_account_name
                account_element = xml.add_element 'account'
                account_element.add_attribute 'name', account_name
                previous_date = nil
            end
            if current_date != previous_date
                date_element = account_element.add_element 'date'
                date_element.add_attribute 'value', current_date
            end
            amount_element = date_element.add_element 'amount'
            amount_element.text = row[AMOUNT_COLUMN]
        end
    end

    def self.generate_xml csv
        xml = REXML::Document.new
        minify_element = xml.add_element 'minify'
        add_account_elements csv, minify_element
        xml
    end

    def self.print(csv)
        csv.sort_by! { |row| [ row[ACCOUNT_COLUMN], ConvertDate(row[DATE_COLUMN]), row[AMOUNT_COLUMN].to_f ] }
        xml = generate_xml csv
        print_xml xml
    end

end