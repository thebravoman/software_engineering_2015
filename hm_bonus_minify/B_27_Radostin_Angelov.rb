require 'csv'
require 'rexml/document'
require 'net/http'
require 'sanitize'
require 'openssl'

DATE_FORMAT  = '%d/%m/%Y'

class Csv_Parser
	def initialize(should_parse_date, should_parse_value, value)
		@data = ''
		@should_parse_date = should_parse_date
		@should_parse_value = should_parse_value
		@value = value.to_f
	end
	
	def parse path, account_or_date
		if path.start_with? 'http' or path.start_with? 'https'
			@data = parse_webpage(path)
		else
			@data = parse_file(path)
		end
		
		result = []
		@data.shift
		
		if @should_parse_date
			@data.each do |row|
				#p row[0]
				#p row[0] == account_or_date
				if row[0] == account_or_date
					result.push(row)
				end
			end
		else
			@data.each do |row|
				if row[1] == account_or_date
					result.push(row)
				end
			end
		end
		
		if @should_parse_value
			current_index = 0
			
			begin
				current_row_value = result[current_index][3].to_f
				if current_row_value < @value - 10 or current_row_value > @value + 10
					result.delete_at(current_index)
				else
					current_index += 1
				end
			end until current_index >= result.length
		end
		
		return result
	end
	
	def parse_file(path)
		data = CSV.read(path)
		return data
	end
	
	def parse_webpage url
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		
		if uri.scheme == 'https'
			http.use_ssl = true
			#you have to take risks
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		end
		
		result = http.get(uri.request_uri)
		text = Sanitize.fragment(result.body)
		return CSV.parse(text)
	end
end

class ResultPrinter
	def initialize
	end
	
	def print_result result
		sum = 0
		result.each do |row_values|
			puts row_values.join(',')
			sum += row_values[3].to_i
		end
		
		if not result.empty?
			puts sum
		end
	end
	
	def to_xml result
		xml_result = REXML::Document.new("")
		
		xml_minify = xml_result.add_element('minify')
		
		result_hash = array_to_hash(result)
		result_hash = result_hash.sort.to_h
		
		#xml_marks = xml_word_counts.add_element('marks')
		#xml_marks.add_text "#{@marks_count}"

		result_hash.each do |account, dates|
			xml_account = xml_minify.add_element('account')
			#xml_account.add_text(key)
			#value.sort
			#p account
			sorted_dates = dates.sort{|first, second| Date.strptime(first[0], DATE_FORMAT) <=> Date.strptime(second[0], DATE_FORMAT)}
			sorted_dates.each do |date_key, amounts|
				xml_date = xml_account.add_element('date')
				#xml_date.add_text(date_key)
				
				amounts.sort! {|a, b| a.to_i <=> b.to_i}
				amounts.each do |amount|
					xml_amount = xml_date.add_element('amount')
					xml_amount.add_text(amount)
				end
			end
		end

		puts xml_result
	end
end

#date account category amount currency description 
#01/12/2014 PersonalCash K -100 BGN Some description
def array_to_hash array
	hash = Hash.new
	array.each do |row|
		date = row[0]
		account = row[1]
		amount = row[3]
		if hash[account]
			if hash[account][date]
				hash[account][date].push(amount)
			else
				hash[account][date] = []
				hash[account][date].push(amount)
			end
		else
			hash[account] = Hash.new
			hash[account][date] = []
			hash[account][date].push(amount)
		end
	end
	
	return hash
end

def is_date string, format
	begin
		Date.strptime(string, format)
		rescue ArgumentError
			return false
		else
			return true
	end
end


path = ARGV[0]
account_or_date = ARGV[1]
value = ARGV[2]

should_parse_value = not(value.nil?)
should_parse_date = is_date(account_or_date, DATE_FORMAT)

parser = Csv_Parser.new(should_parse_date, should_parse_value, value)
printer = ResultPrinter.new

if account_or_date != "xml"
	result = parser.parse(path, account_or_date)
	result.sort! {|first, second| Date.strptime(first[0], DATE_FORMAT) <=> Date.strptime(second[0], DATE_FORMAT)}
	printer.print_result(result)
else
	result = read_csv(path)
	printer.to_xml(result)
end