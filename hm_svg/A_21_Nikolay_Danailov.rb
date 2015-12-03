require 'json'

class SVGTreeGenerator

  def initialize
    @STARTING_X = 200
    @STARTING_Y = 100
    @RECT_WIDTH = 100
    @RECT_HEIGHT = 50

    @result = ''
  end

  def generate_from_json(json)
    
  end
end

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

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
result_file_name = "A_21_Nikolay_Danailov.svg"

File.open(result_file_name, 'w') do |f|
  f << '<svg xmlns="http://www.w3.org/2000/svg">'
  f << SVGTreeGenerator.new.generate_from_json(json)
  f << '</svg>'
end
