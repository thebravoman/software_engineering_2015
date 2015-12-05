require 'word_counter'
filepath = ARGV[0]
beginning = ARGV[0].split('/').first

def webb
	if( beginning = 'http:' || beginning = 'https:')
		result = WordCounter.parse_webpage(filepath)
	else
		result = WordCounter.parse_file(filepath)
	end
end

webb(beginning)

if ARGV[1] == 'json'
    puts result.to_json

elsif ARGV[1] == 'xml'
    puts result.to_xml
#elsif ARGV[1] == "svg"
	#result coming soon...
else
    puts result.to_csv
end

