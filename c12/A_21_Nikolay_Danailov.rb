require 'json'

class JSONTreeMaker
  def self.parse_json(element, depth = 0)
    spaces = ' ' * depth

    if(element.class == Hash)
      element.each do |key, value|
        if(value.class == Hash || value.class == Array)
          parse_json value, depth + 1
        else
          puts "#{spaces}#{value}"
        end
      end
    elsif(element.class == Array)
      element.each do |e|
        parse_json e, depth + 1
      end
    else
      puts "#{spaces}#{element}"
    end
  end
end

file = File.read "A_21_Nikolay_Danailov.json"
json = JSON.parse file
JSONTreeMaker.parse_json json
