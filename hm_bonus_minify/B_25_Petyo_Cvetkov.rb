require 'csv';
DATE = 0
AMOUNT = 3

class Monefy
  def initialize filename, date, amount
    @date = date
    @filename = filename
    @my_csv
    @amount = amount
  end

  def read_file
      @my_csv = CSV.read(@filename)
  end

  def filter_date
    @my_csv = @my_csv.select{|num| num[DATE] == @date && num[AMOUNT].to_i >= @amount.to_i - 10 &&
       num[AMOUNT].to_i <= @amount.to_i + 10}
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

myApp = Monefy.new ARGV[0], ARGV[1], ARGV[2]
myApp.read_file
myApp.filter_date
myApp.print_csv
