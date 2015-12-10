require 'csv'

class PersonalFinance
  
  def value_and_date csv_doc, date_path, value
    
    csv_doc.each do |row|
      if row[0] == date_path.to_s and ((row[3].to_i <= value + 10) and (row[3].to_i >= value - 10))
        puts row.join(",")
        
      elsif value == 0 and row[0] == date_path.to_s
        puts row.join(",")
      end
    end 
  end

  def by_account csv_doc, string 
    sum = 0
    acc = []
    
    csv_doc.each do |row|
      if row[1] == string
        acc << row.join(",")
        sum += row[3].to_i
      end
    end
    
    acc.sort_by! { |date| date}
    puts acc 
    puts sum
  end
  
end


filepath = ARGV[0]
in_string = ARGV[1]
value = ARGV[2]

csv_doc = CSV.read(filepath)
csv_doc.shift 

my_account = PersonalFinance.new

if in_string.count("/") == 2 #the string is a date becasue date format is DD/MM/YYYY
  my_account.value_and_date csv_doc, in_string, value.to_i
  
elsif in_string =~ /[\w]/ #the string has letters so it's not a date
  my_account.by_account csv_doc, in_string
end