require 'csv'


def print_by_date csv_doc, date_path
    
  margin = date_path.split("/").first  
    
  csv_doc.each do |row|
    if row[0] == date_path.to_s
      puts row.join(",")
    end
  end
  
end


filepath = ARGV[0]
date_path = ARGV[1]

csv_doc = CSV.read(filepath)
csv_doc.shift

print_by_date(csv_doc, date_path)

