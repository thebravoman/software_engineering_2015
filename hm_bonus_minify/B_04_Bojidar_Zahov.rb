file  = ARGV[0]
is_url = file.split('/').first 
puts is_url
date  = ARGV[1]
value = ARGV[2].to_i
require 'csv'
require 'rexml/document'
require 'net/http'
require 'sanitize'
require 'openssl'
sum = 0
aaa = date.gsub(/^\//,'')
write = []
case date
when "xml"
    
     if is_url == "https:" || is_url == "http:"
         
          uri = URI(ARGV[0])
          input = Net::HTTP.get(uri)
           string = Sanitize.clean(input, :remove_contents => ['script', 'style'])

        
          input = input.split(",")
     else
     input = CSV.read file
     end
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

