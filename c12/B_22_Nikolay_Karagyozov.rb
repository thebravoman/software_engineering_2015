require 'json'

def print_json(hash, indentation)
  if hash.kind_of?(Array)
    hash.each { |element| print_json(element, indentation + 1) }
    return
  end
  if hash.kind_of?(Hash)
    hash.values.each { |key| print_json(key, indentation + 1) }
    return
  end

  puts ("-" * indentation) + hash.to_s
end

jsonFile = File.read("B_22_Nikolay_Karagyozov.json")

content = JSON.parse(jsonFile)

school = content['school']

print_json(school, -1)
