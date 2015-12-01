require 'json'

content = File.read("A_16_Kristiana_Ivanova.json")

parsered = JSON.parse(content)

puts content