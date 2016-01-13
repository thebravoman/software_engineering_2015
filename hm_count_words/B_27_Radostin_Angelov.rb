module WordCounter
	require 'word_counter.rb'

	input_to_parse = ARGV[0]
	file_format = ARGV[1]
	result = WordCounter.get_cached(input_to_parse)
	if (result.nil?)
		if ARGV.include? '-d'
			if ARGV[0] == '-d'
				ARGV.shift
			end

			input_to_parse = ARGV[0]
			file_format = ARGV[1]

			result = WordCounter.parse_folder(input_to_parse)
		else
			text = ""
			if input_to_parse.start_with? "http://" or input_to_parse.start_with? "https://"
				result = WordCounter.parse_webpage(input_to_parse)
			elsif
				result = WordCounter.parse_file(input_to_parse)
			end
		end
	end

	result.to_svg
	case file_format
		when "json"
			result.to_json
		when "xml"
			result.to_xml
		when "svg"
			result.to_svg
		else
			result.to_csv
	end
end
