require 'json'

def self.rect(x, y, w, h)
  '<rect x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" width="' + w.to_s + \
    '" height="' + h.to_s + \
    '" fill="red"/>'
end

def self.text(x, y, str)
  '<text x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" fill="black">' + str.to_s + '</text>'
end

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file

elements = json.values
first_element = elements
puts first_element[0]
first_element[1].each do |second_element|
  second_element_values = second_element.values
  puts "  #{second_element_values[0]}"

  second_element_values[1].each do |third_element|
    third_element_values = third_element.values
    puts "    #{third_element_values[0]}"
  end
end