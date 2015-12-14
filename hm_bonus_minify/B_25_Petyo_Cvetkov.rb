require 'csv'
require 'rexml/document'
require 'open-uri'



  DATE = 0
  ACCOUNT = 1
  CATEGORY = 2
  AMOUNT = 3
  CURRENCY = 4
  DESCRIPTION = 5


class Monefy
  def initialize filename
    @filename = filename

  end
  def is_date? string
   string.match(/\d{2}\/\d{2}\/\d{4}/)
  end

  def is_string string
    string != 'xml'
  end


  def read_csv
    @my_csv = CSV.read(@filename)
  end

  def filter_by_date date
    if ARGV[2].nil?
    @my_csv = @my_csv.select{|row| row[DATE] == date}
    else
      @my_csv = @my_csv.select{|row| row[DATE] == date && row[AMOUNT].to_i >= ARGV[2].to_i - 10 && row[AMOUNT].to_i <= ARGV[2].to_i + 10 }
    end
  end

  def filter_by_account acc_name
    @result_val = 0
    @my_csv = @my_csv.select{|line| line[ACCOUNT] == acc_name }
    @my_csv.select{|line|  @result_val += line[AMOUNT].to_i }
  end

  def print_acc_format
    csv = CSV.generate do |write|
      @my_csv.each do |row|
        write << row
      end
    end
    puts csv
    puts @result_val
  end

  def printing_for_date
    csv = CSV.generate do |write|
      @my_csv.each do |row|
        write << row
      end
    end
    puts csv

  end

  def to_xml
    @my_csv.sort! {|a, b| [b[1].to_s, a[0].to_s, a[3].to_i] <=> [a[1].to_s, b[0].to_s, b[3].to_i] }
    temp = []

    xml_doc = REXML::Document.new("")

    node = xml_doc.add_element('minify')

    temp = @my_csv[0][1]
    account = node.add_element("account")
    account.add_attribute("", "#{temp}")

    temp_date = @my_csv[0][0]

    @my_csv.each do |row|
      if row [1] == temp
        date = account.add_element("date")
        date.add_attribute("", "#{row[0]}")

        amount = date.add_element("amount")
        amount.add_attribute("", "#{row[3]}")

      elsif row[1] != temp
        temp = row[1]
        account = node.add_element("account")
        account.add_attribute("", "#{row[1]}")

        date = account.add_element("date")
        date.add_attribute("", "#{row[0]}")

        amount = date.add_element("amount")
        amount.add_attribute("", "#{row[3]}")
      end

    end

    out = ''
    xml_doc.write(out, 1)
    puts out

  end

  def download_csv(path)
    #puts path
    path = path.to_s.gsub("github.com", "raw.githubusercontent.com")
    path = path.to_s.gsub("/blob", "")

      open(path.to_s) do |f|
        @my_csv = CSV.parse(f)
      end
      if !@my_csv[0][0].match(/\d{2}\/\d{2}\/\d{4}/)
        @my_csv.delete_at(0)
      end
    end

end

myApp = Monefy.new ARGV[0]
if ARGV[0].start_with?("http://", "https://")
  myApp.download_csv(ARGV[0])
else
myApp.read_csv
end

if myApp.is_date? ARGV[1]
  myApp.filter_by_date ARGV[1]
  myApp.printing_for_date

elsif myApp.is_string ARGV[1]

myApp.filter_by_account ARGV[1]
myApp.print_acc_format
else
myApp.to_xml
end
