=begin
require 'json'

file = File.read('json.json')
data_hash = JSON.parse(file)
output = Hash[*data_hash.map{|k,l|l.map{|v|[v,k]}}.flatten]
output.each {|k,v| puts "#{k}"}
#print data_hash
=end
require 'json'

json_string = File.read('B_09_Georgi_Stoilov.json')
json_object = JSON.parse(json_string)

def print_hashmap(json_object, offset)
  json_object.each do |key, value|
    puts ' '*offset + key

    case value
    when Hash
      print_hashmap(value, offset + 2)
    when Array
      value.each do |v|
        puts ' '*(offset + 2) + v.to_s
      end
    end
  end
end

print_hashmap(json_object, 0)
