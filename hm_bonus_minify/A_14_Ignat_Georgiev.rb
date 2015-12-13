require 'csv'
require "rexml/document"
require 'net/http'
require 'sanitize'
require 'openssl'
def date_value csv , date , value
  csv.each do |line|
    if line[0]==date
      if value !=0
        if line[3].to_i.between?((value-10),(value+10))
          puts line.join(',')
        end
      else		
	puts line.join(',')
 	 end
	end
	end
end
def string_csv csv,string
sum = 0
csv.sort!
 csv.each do |line|
    if line[1]==string
          puts line.join(',')	
	  sum = line[3].to_i + sum
        end
	end
puts sum
end
def to_xml csv 
  csv = csv.sort_by { |a| [a[1].to_s.downcase , a[0].split("/").last , a[0].split("/")[1], a[0].split("/").first, a[3].to_f]}
  xml_new = REXML::Document.new('')
  xml_root=xml_new.add_element('minify')
  csv.each do |line|
	xml_account = xml_root.add_element('account')
	xml_account.add_text "#{line[1]}"
	xml_date = xml_account.add_element('date')
	xml_date.add_text "#{line[0]}"
	xml_amount = xml_date.add_element('amount')
	xml_amount.add_text "#{line[3]}"
  end
  formatter = REXML::Formatters::Pretty.new(2)
  formatter.compact
  formatter.write(xml_new, $stdout)
  end
def parse_url uri
      uri = URI.parse(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      result = http.get(uri.request_uri)
      string = Sanitize.clean(result.body, :remove_contents => ['script', 'style'])
  end
def file_site filename
  protocol = filename.split('/').first
  return protocol == 'http:' || protocol == "https:"
end
puts ARGV[0].split('.').last
if file_site ARGV[0]
array = parse_url ARGV[0]
else
array = CSV.read(ARGV[0])
end
second = ARGV[1]
third = ARGV[2].to_i
check_if_date = second.scan(/[a-zA-z]/).count
if check_if_date>0 && second != "xml"
string_csv array,second
elsif second =="xml"
	to_xml array
else
date_value array,second,third
end	
