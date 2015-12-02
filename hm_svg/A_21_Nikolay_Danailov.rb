require 'json'

class SVGTreeMaker
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
      '" fill="black">' + str.to_s + \
      '</text>'
  end

  def self.parse_json(element, depth = 0)
    spaces = ' ' * depth

    if(element.class == Hash)
      element.each do |key, value|
        parse_json value, depth
      end
    elsif(element.class == Array)
      element.each do |e|
        parse_json e, depth + 2
      end
    else
      puts "#{spaces}#{element}"
    end
  end
end

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
SVGTreeMaker.parse_json json
