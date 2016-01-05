require 'json'
require 'pp'
my_hash = File.read(ARGV[0])
my_other_hash = JSON.parse(my_hash)
my_other_hash.keys.each do |key|
  p key
  p my_other_hash[key]["name"]=> "class"
end
