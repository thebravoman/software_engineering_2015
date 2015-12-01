require 'json'

json_string = File.read('B_19_Martin_Angelov.json')
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

print_hashmap(json_object, 0)
