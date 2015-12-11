require 'csv';
DATE = 0
ACCOUNT = 1
AMOUNT = 3

class Monefy
  def initialize filename, acc_name
    @acc_name = acc_name
    #@date = date
    @filename = filename
    #@my_csv
    #@amount = amount
    @result_val = 0

  end

  def read_file
      @my_csv = CSV.read(@filename)
  end

  def filter_date
    @my_csv = @my_csv.select{|line| line[ACCOUNT] == @acc_name}
    @my_csv.select{|line| @result_val += line[AMOUNT].to_i}
  end

  def sort_result
    @my_csv = @my_csv.sort_by{|d| m,d,y=d[0].split("/");[y,m,d] }


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

  def print_csv
    csv = CSV.generate do |write|
      @my_csv.each do |row|
        write << row
      end
    end
    puts csv
  end


end

myApp = Monefy.new ARGV[0], ARGV[1]
myApp.read_file
myApp.filter_date
myApp.sort_result
myApp.print_acc_format
