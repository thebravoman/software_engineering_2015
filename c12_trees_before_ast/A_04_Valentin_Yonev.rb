require 'json'

json = File.read('A_04_Valentin_Yonev.json')
jsonParsed = JSON.parse(json)

school = jsonParsed['school']
puts "#{school['name']}"
school["class"].each do |c|
  puts "- #{c["name"]}"
  c["students"].each do |s|
    puts "-- #{s["name"]} #{s["number"]}"
  end
end
