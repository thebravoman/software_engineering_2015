require 'csv'
require 'rexml/document'

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
  
  
  def to_xml csv_doc
    temp = []
    
    xml_doc = REXML::Document.new("")
    
    node = xml_doc.add_element('minify')
    
    temp = csv_doc[0][1]
    account = node.add_element("account")
    account.add_attribute("", "#{temp}")
    
    temp_date = csv_doc[0][0]
    
    csv_doc.each do |row|   # Same dates appear as different nodes - have to fix
      
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
  
  def sort_csv csv_doc 
    return csv_doc.sort! {|a, b| [b[1].to_s, a[0].to_s, a[3].to_i] <=> [a[1].to_s, b[0].to_s, b[3].to_i] }  # i think this doesn't sort correctly
  end
  
end


filepath = ARGV[0]
in_string = ARGV[1]
value = ARGV[2]

csv_doc = CSV.read(filepath)
csv_doc.shift 

my_account = PersonalFinance.new

if in_string.count("/") == 2 #the string is a date becasue it has 2 'slashes'. Date format is DD/MM/YYYY
  my_account.value_and_date csv_doc, in_string, value.to_i
  
elsif in_string =~ /[\w]/ #the string has letters so it's not a date
  
  if in_string != "xml"
    my_account.by_account csv_doc, in_string
  
  elsif in_string == "xml"
    my_account.to_xml(my_account.sort_csv(csv_doc))
  end
    
end
