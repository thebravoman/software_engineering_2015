require 'csv'
class Printing
  def printing_without_value csv_file, date
    csv_file.each do |element|
      if element[0] == date
        puts element * ","
      end
    end
  end

  def printing_with_value csv_file, date, value
    csv_file.each do |element|
      if element[0] == date && element[3].to_i.between?((value-10),(value+10))
        puts element * ","
      end
    end
  end
end
csv_file = CSV.read ARGV[0]
date = ARGV[1]
value = ARGV[2].to_s

DATE_ROW = 0 #Kato go zloja v metoda mi dava error ;()
if ARGV[2] 
  Printing.new.printing_with_value(csv_file, date, value.to_i)
else 
  Printing.new.printing_without_value(csv_file, date)
end