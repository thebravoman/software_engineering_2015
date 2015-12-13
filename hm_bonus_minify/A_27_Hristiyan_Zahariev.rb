require 'csv'
require "rexml/document"
require 'net/http'
require 'sanitize'
require 'openssl'

class Printing
  def without_value csv_file, string
    csv_file.each do |element|
      if element[0] == string
        puts element * ","
      end
    end
  end

  def with_value csv_file, string, value
    csv_file.each do |element|
      if element[0] == string && element[3].to_i.between?((value.to_i-10),(value.to_i+10))
        puts element * ","
      end
    end
  end

  def matched_string csv_file, string, sum_of_values
  csv_file.sort!{|a,b| a[0] <=> b[0]}
    csv_file.each do |element|
      if element[1].to_s == string
        puts element * ","
        sum_of_values = element[3].to_i + sum_of_values
      end
    end
    puts "#{sum_of_values}"
  end
  def xml csv_file
    xml_file = REXML::Document.new("")
    node = xml_file.add_element("minify")
    csv_file.sort! {|a, b| [a[1].to_s, a[0].to_s, a[3].to_i] <=> [b[1].to_s, b[0].to_s, b[3].to_i] }
    csv_file.each do |row|
      account = node.add_element("account")
      account.add_text row[1]
      date = account.add_element("date")
      date.add_text row[0]
      amount = date.add_element("amount").add_text row[3].to_s
    end
    formatter = REXML::Formatters::Pretty.new
    formatter.compact = true
    formatter.write(xml_file, $stdout)
  end

  def if_url input_file
      uri = URI.parse(input_file)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      result = http.get(uri.request_uri)
      string = Sanitize.clean(result.body, :remove_contents => ['script', 'style'])
      csv = CSV.parse(string)    
  end
end

def url? input_file
  true if input_file.split("/").first == "https:" or input_file.split("/").first == "http:" rescue false
end

def date? str
  splashes =  str.count("/")
  words = str.scan(/[a-z_\s]/).count
  true if (splashes == 2) && (words == 0) rescue false
end

def xml? str
  true if str=="xml" rescue false
end

def number? str
  true if Float(str) rescue false
end

input_file = ARGV[0]
printer = Printing.new()
string = ARGV[1]
value = ARGV[2]
sum_of_values = 0

if url? input_file
  printer.if_url input_file
else
  csv_file = CSV.read(input_file)
  if date? string
    if ARGV[2]
      printer.with_value(csv_file, string, value)
    else 
      printer.without_value(csv_file, string) 
    end
  elsif xml? string
    printer.xml(csv_file)
  elsif !(number? string)
    printer.matched_string(csv_file, string, sum_of_values)
  end
end
