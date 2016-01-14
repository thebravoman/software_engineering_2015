require_relative 'file_parser'

module WordCounter
	class FolderParser
		def parse_folder folder
			directory = folder.gsub("\n",'')
			directory.insert(directory.size, '/**/*.*')
			Dir.glob(directory).each do |file|
				result = FileParser.new.parse_file file
				if ARGV[2] == 'csv' or ARGV[2] == nil
					result.to_csv
				elsif ARGV[2] == 'json'
					result.to_json
				elsif ARGV[2] == 'xml'
					result.to_xml
				end
			end
		end
	end
end
