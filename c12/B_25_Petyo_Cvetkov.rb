require 'json'
require 'pp'
a = File.read('B_25_Petyo_Cvetkov.json')

result = JSON.parse(a)

p result
