require 'word_counter'
require_relative 'src/SVG/SVG.rb'

def handle_repo_parsing(folder, file_extension, json_res_file, svg_res_file)
	result = WordCounter.parse_folder folder, :rb
	puts result.to_json
	SVGWriter.make_svg(result, "result.svg")
end

folder = ARGV[0]