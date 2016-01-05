require 'json'
require_relative 'A_21_Nikolay_Danailov/svg_tree_generator.rb'

RESULT_FILE = 'A_21_Nikolay_Danailov.svg'

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
tree_generator = SVGTreeGenerator.new

File.open(RESULT_FILE, 'w') do |f|
  f << tree_generator.generate_from_json(json)
end