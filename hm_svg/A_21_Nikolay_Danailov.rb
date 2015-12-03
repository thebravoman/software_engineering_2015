require 'json'
require_relative 'A_21_Nikolay_Danailov/svg_tree_generator.rb'

def rect(x, y, w, h)
  '<rect x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" width="' + w.to_s + \
    '" height="' + h.to_s + \
    '" fill="red"/>'
end

def text(x, y, str)
  '<text x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" fill="black">' + str.to_s + '</text>'
end

RESULT_FILE = "A_21_Nikolay_Danailov.svg"

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
tree_generator = SVGTreeGenerator.new
tree_generator.generate_from_json json
tree_generator.draw
