require 'json'

json_string = File.read('B_26_Plamen_Neshkov.json')
json_object = JSON.parse(json_string)

def print_hashmap(json_object, offset)
  json_object.each do |key, value|
    puts ' '*offset + key

    case value
    when Hash
      print_hashmap(value, offset + 2)
    when Array
      value.each do |v|
        puts ' '*(offset + 2) + v
      end
    end
  end
end

def svg_text(x, y, string)
  %Q|<text x="#{x}" y="#{y}" fill="red">
  #{string}
  </text>|
end

def svg_hashmap(json_object, x, y)
  json_object.each do |key, value|
    $svg << svg_text(x, y, key)

    case value
    when Hash
      svg_hashmap(value, x, y + 50)
    when Array
      value.each do |v|
        $svg << svg_text(x, y + 50, v)
        x += v.length * 15
      end
    end
  end
end

$svg = ""
$svg << '<svg width="1000" height="1000"
        xmlns="http://www.w3.org/2000/svg">'

svg_hashmap(json_object, 50, 50)

$svg << '</svg>'
puts $svg

File.open('result.svg', 'w') { |f| f.write($svg) }
