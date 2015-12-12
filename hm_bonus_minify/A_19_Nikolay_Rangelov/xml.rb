require_relative 'constants.rb'

class Xml
	def self.generate_xml_from_csv(csv_file)
		result = ""
		result = "<minify>\n"
		for i in 0..csv_file.length-1
			result = result + "\t<account value=\""+csv_file[i][COL::ACCOUNT]+"\">\n"
			result = result + "\t\t<date value=\""+csv_file[i][COL::DATE]+"\">\n"
			result = result + "\t\t\t<amount>" + csv_file[i][COL::AMOUNT] + "</amount>\n"
			result = result + "\t\t</date>\n"
			result = result + "\t</account>\n"
		end
		result = result + "</minify>"
	end
end