require 'csv'
require 'rexml/document'
require 'net/http'
require 'sanitize'
require 'openssl'
#require 'open-uri'


class Csv_Parser
	def initialize
		@data = ''
	end
	
	def parse path, input_account
		if path.start_with? 'http' or path.start_with? 'https'
			@data = parse_webpage(path)
		else
			@data = parse_file(path)
		end
		
		result = []
		@data.shift
		@data.each do |row|
			if row[1] == input_account
				result.push(row)
			end
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
		return CSV.read(text)
	end
end

def read_csv path
	result = []
	data = CSV.read(path)
	data.shift
	data.each do |row|
		result.push(row)
	end
	
	return result
end

def print_result result
	sum = 0
	result.each do |row_values|
		puts row_values.join(',')
		sum += row_values[3].to_i
	end
	
	puts sum
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
		date_format = '%d/%m/%Y'
		sorted_dates = dates.sort{|first, second| Date.strptime(first[0], date_format) <=> Date.strptime(second[0], date_format)}
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

path = ARGV[0]
account = ARGV[1]

parser = Csv_Parser.new

if account != "xml"
	result = parser.parse(path, account)
	date_format = '%d/%m/%Y'
	result.sort! {|first, second| Date.strptime(first[0], date_format) <=> Date.strptime(second[0], date_format)}
	print_result(result)
else
	result = read_csv(path)
	to_xml(result)
end