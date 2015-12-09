require 'csv';
class Monefy
  def initialize filename, date
    @date = date
    @filename = filename
    @my_csv
  end

  def read_file
      @my_csv = CSV.read(@filename)
  end

  def filter_date
    @my_csv = @my_csv.select{|num| num[0] == @date}
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
myApp.print_csv
