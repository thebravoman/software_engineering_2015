require 'csv'

in_file = ARGV[0]
command = ARGV[1]
value = ARGV[2]
max_value = ARGV[3]

csv_doc = CSV.read in_file

def sort_by_column csv_doc, value
  if value == "0"
    csv_doc.sort! {|a, b| (a[0].to_s) <=> (b[0].to_s) }
  elsif value == "1"
    csv_doc.sort! {|a, b| (a[1]) <=> (b[1]) }
  elsif value == "2"
    csv_doc.sort! {|a, b| (a[2].to_i) <=> (b[2].to_i) }
  end
  
  CSV.open("result.csv", "w") do |content|
    csv_doc.each {|index| content << index}
  end
  
end

def filter_costs csv_doc, value, max_value
  csv_doc.select! {|a| a[2].to_i >= value.to_i && a[2].to_i <= max_value.to_i}
  
  sort_by_column csv_doc, "2"
    
  CSV.open("result.csv", "w") do |content|
    csv_doc.each {|index| content << index}
  end
  
end

if command == "sort"
  sort_by_column csv_doc, value
  
  if max_value == "DESC"
   csv_doc = csv_doc.reverse
    
    CSV.open("result.csv", "w") do |content|
      csv_doc.each {|index| content << index}
    end
  end

elsif command == "filter_costs"
  filter_costs csv_doc, value, max_value
end
