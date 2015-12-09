require 'json'
require 'pp'

hash = JSON.parse(File.read(ARGV[0]))

hash.keys.each do |key|
	p key
	p hash[key]["name"]=> "class"
end
