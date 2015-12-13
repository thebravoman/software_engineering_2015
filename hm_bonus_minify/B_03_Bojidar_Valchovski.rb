require 'net/http'
require 'sanitize'
require 'openssl'
require 'rexml/document'
require 'date'
require 'csv'

path = ARGV[0]
option = ARGV[1]
value = ARGV[2].to_f
sum = 0 
line = 0

my_csv = ""

is_url = path.start_with?("http://") || path.start_with?("https://")

def to_xml(my_csv)
  my_csv = my_csv.sort_by { |a| [a[1].to_s.downcase , a[0].split("/").last , a[0].split("/")[1], a[0].split("/").first, a[3].to_f]}

  doc = REXML::Document.new('')
	  
  node = doc.add_element('minify')

  my_csv.each do |row|
    puts row[0].gsub("/",'')
    acc = node.add_element('account')
    date = acc.add_element('date')
    amount = date.add_element('amount').text = "#{row[3]}"
	acc.add_attribute('name', "#{row[1]}")
    date.add_attribute('value', "#{row[0]}")
  end

  formatter = REXML::Formatters::Pretty.new
  formatter.compact = true
  formatter.write(doc, $stdout)

  p    
end

def parse_web(url)
  uri  = URI.parse(url)

  http = Net::HTTP.new(uri.host, uri.port)

  if uri.scheme == 'https'
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
 
  result = http.get(uri.request_uri)

  text = Sanitize.clean(result.body, :remove_contents => ['script', 'style'])  
  my_csv = CSV.parse(text)  
end
	
def is_date(option)
  begin
    Date.parse(option)
    return true;
  rescue ArgumentError
    return false;
  end
end

if is_url
  parse_web(path)
else
  my_csv = CSV.read(path)
  my_csv.each do |row|
  if ARGV.length == 2
    if is_date(option)
	  if row[0] == option
        puts row.join(',')
      end
    elsif option == "xml"
      puts to_xml(my_csv)
      break;
    else
	  if row[1] == option
		sum+=row[3].to_i
        puts row.join(',')
      end
      if line == my_csv.length-1
	    puts sum
      end
	  line+=1
    end
  elsif ARGV.length == 3
    if (row[0] == option)
      if (row[3].to_f > (value - 10)) && (row[3].to_f < (value + 10))
        puts row.join(',')
      end
    end
  end
end
end
