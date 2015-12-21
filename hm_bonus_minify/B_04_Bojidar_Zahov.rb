require 'csv'
require 'rexml/document'
require 'net/http'
require 'sanitize'
require 'openssl'
# -------------------
file  = ARGV[0]
is_url = file.split('/').first 
puts is_url
date  = ARGV[1]
value = ARGV[2].to_i
sum = 0
#--------------------
if ARGV[1] != nil
     aaa = date.gsub(/[^\/]/,'')
else
     aaa = "";
end

if is_url == "https:" || is_url == "http:"  #V5
         
          uri = URI(ARGV[0])
          input = Net::HTTP.get(uri)
           string = Sanitize.clean(input, :remove_contents => ['script', 'style'])
          puts input
        
          input = input.split(",")
     else
     input = CSV.read file
end

if ARGV[1] == "xml"    # v4
     
     #input= []
     xml = REXML::Document.new
	tag = REXML::Element.new('minify')
	input.sort_by! do |row|
				date = row[0].split('/')
				[row[1],date[2].to_i,date[1].to_i,date[0].to_i,row[3].to_i]
	end
	input.each do |row|
			tag.add_element('account').add_text(row[1]).add_element('date').add_text(row[0]).add_element('amount').add_text(row[3].to_s)
	end
	result_xml = ""
    p = REXML::Formatters::Pretty.new(4)
    p.write(tag, result_xml)
    puts result_xml
end
if !(aaa == "///" || aaa == "xml") # V3
	write = []
	input.each do |row|
		if row[1].to_s == aaa 
			          write << [row.join(",")]
			          sum+=row[3].to_i
			          
		end
end
     puts write.sort!{|a,b| a[0] <=> b[0]}
	if sum != 0
	     puts sum
     end
end

if ARGV[0].split(".").last == "csv" && aaa == "//" && ARGV[2].match(/\d/) #V2
	#CSV.open('B_04_Bojidar_Zahov.csv', 'w') do |write|
	input.each do |row|
		if row[0] == date 
		     if row[3].to_i.between?(value-10, value+10)
			     puts row.join(",")
			          write << [row.join(",")]
			    
		     end
		end
	#end
end
end
if ARGV[0].split(".").last == "csv" && aaa == "//" && ARGV[2] == nil #V1 
     input.each do |row|
      	if row[0] == date
 		     puts row.join(",")
 	     end
     end
end
