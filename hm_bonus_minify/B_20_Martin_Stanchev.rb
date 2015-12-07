require 'csv'

def print_by_date csv_doc, date_path, value
    
  margin = date_path.split("/").first  
    
  csv_doc.each do |row|
    if row[0] == date_path.to_s and ((row[3].to_i <= value + 10) and (row[3].to_i >= value - 10))
      puts row.join(",")
      
    elsif value == 0 and row[0] == date_path.to_s
      puts row.join(",")
    end
   
  end
  
end


filepath = ARGV[0]
date_path = ARGV[1]
value = ARGV[2]

csv_doc = CSV.read(filepath)
csv_doc.shift

print_by_date(csv_doc, date_path, value.to_i)
