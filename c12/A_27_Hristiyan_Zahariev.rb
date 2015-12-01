require 'json'

input_file = ARGV[0]

json = ''
fileName = File.read(input_file)
json_parser = JSON.parse(fileName)
  
def print_hash(json_parser, set)
  json_parser.each do |key, value|
  puts ' '*set + key
  
  case value
    when Hash
      print_hash(value, set+2)
    when Array
      value.each do |val|
        puts ' '*(set+2) + val
      end
    end
  end
end

print_hash(json_parser, 0)

