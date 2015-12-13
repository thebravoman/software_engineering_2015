require_relative './csv_parser.rb'
require_relative './web_parser.rb'

module Monefy
	def self.parse_file(file)
		CSVParser.new.parse_csv(file)
	end
	
	def self.parse_website(file)
		WebParser.new.parse_website(file)
	end
end
