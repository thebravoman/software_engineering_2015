require 'csv'
require 'rexml/document'
require 'open-uri'
require 'date'



  DATE = 0
  ACCOUNT = 1
  CATEGORY = 2
  AMOUNT = 3
  CURRENCY = 4
  DESCRIPTION = 5


class Monefy
  def initialize filename
    @filename = filename
    @my_csv = []
  end

  def get_month months_range
      best_gain = 0
      best_expense = 0
      expense_start_date  = ''
      expense_end_date = ''
      gain_start_date = ''
      gain_end_date = ''
      @my_csv.sort_by!{|date|
    		array = date[0].split('/')
    		month = array[1].to_i
    		day = array[0].to_i
    		year = array[2].to_i

    		[year, month, day]
    	}
      save = []
      j = 0
      while j < @my_csv.size
        gain_test = 0
        expense_test = 0
        date = @my_csv[j][DATE].split('/')
        i = date[1].to_i
        counter = j
        while counter  < @my_csv.size
          date_from_csv = @my_csv[counter][DATE].split('/')
          if date_from_csv[1].to_i <= (i + months_range.to_i - 1) && date_from_csv[1].to_i >= i && date_from_csv[2].to_i == date[2].to_i
            if @my_csv[counter][AMOUNT].to_i > 0
              gain_end_date_test = @my_csv[counter][DATE]
              gain_test += @my_csv[counter][AMOUNT].to_i
            else
              expense_end_date_test = @my_csv[counter][DATE]
              expense_test += @my_csv[counter][AMOUNT].to_i
            end
          else
            break
          end
          counter += 1
        end
        if gain_test > best_gain
          best_gain = gain_test
          gain_start_date = @my_csv[j][DATE]
          gain_end_date = gain_end_date_test
        end
        if expense_test < best_expense
          best_expense = expense_test
          expense_start_date = @my_csv[j][DATE]
          expense_end_date = expense_end_date_test
        end
        j +=1
      end
      print_periods gain_start_date.to_s, gain_end_date.to_s, best_gain.to_s, expense_start_date.to_s , expense_end_date.to_s, best_expense.to_s
    end

    def print_periods (gain_start, gain_end, gain_value, expense_start, expense_end, expense_value)
      xml_result = REXML::Document.new("")

  		xml_minify = xml_result.add_element('minify')

  		xml_gain = xml_minify.add_element('gain')

  		gain_date_start = xml_gain.add_element('date_start')
  		gain_date_start .add_text(gain_start)

  		gain_date_end = xml_gain.add_element('date_end')
  		gain_date_end.add_text(gain_end)

  		xml_gain_value = xml_gain.add_element('value')
  		xml_gain_value.add_text(gain_value)

  		xml_expense = xml_minify.add_element('expense')
  		xml_expense_start = xml_expense.add_element('date_start')
  		xml_expense_start.add_text(expense_start)

  		xml_expense_end = xml_expense.add_element('date_end')
  		xml_expense_end.add_text(expense_end)

  		xml_expense_value = xml_expense.add_element('value')
  		xml_expense_value.add_text(expense_value)
      out = ''
      xml_result.write(out, 1)
      puts out



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
elsif ARGV[1] =~ /\A\d+\Z/

myApp.get_month ARGV[1]

elsif myApp.is_string ARGV[1]

myApp.filter_by_account ARGV[1]
myApp.print_acc_format
else
myApp.to_xml
end
