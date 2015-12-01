#root, child node, leaf, sibblings
require 'rubygems'
require 'json'
text=File.open(ARGV[0]).read
hash = JSON.parse(text)
hash.each do|name|
	puts name[0]
	in_hash = name[1].to_json
	hash1 = JSON.parse(in_hash)
	hash1.each do |name1|
	puts name1
	end
end


