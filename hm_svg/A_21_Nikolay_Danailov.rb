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

STARTING_X = 500
STARTING_Y = 100

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
result_file_name = "A_21_Nikolay_Danailov.svg"

current_x = STARTING_Y
current_y = STARTING_Y
square_side = 20

File.open(result_file_name, 'w') do |f|
  f << '<svg xmlns="http://www.w3.org/2000/svg">'
  first_element = json
  first_element_values = first_element.values
  puts first_element_values[0]
  f << rect(STARTING_X, current_y, square_side, square_side)

  first_element_values[1].each_with_index do |second_element, i|
    second_x = STARTING_X * 2 / (first_element_values[1].size + 1) * (i + 1)
    current_y = STARTING_Y + 100
    puts "second_x[#{i}]: #{second_x}"
    second_element_values = second_element.values
    puts "  #{second_element_values[0]}"
    f << rect(second_x, current_y, square_side, square_side)
    
    current_y += 100

    second_element_values[1].each_with_index do |third_element, j|
      third_x_per_element = ((second_x - (second_x / first_element_values[1].size) * i) * 2 / (second_element_values[1].size + 1) * (j + 1))
      element_x = second_x / first_element_values[1].size * i + third_x_per_element
      puts "element_x[#{j}]: #{element_x}"
      third_element_values = third_element.values
      puts "    #{third_element_values[0]}"
      f << rect(element_x, current_y, square_side, square_side)
    end
  end

  f << '</svg>'
end