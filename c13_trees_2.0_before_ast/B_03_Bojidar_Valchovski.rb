require 'rexml/document'

string = File.read(ARGV[0])

doc = REXML::Document.new string

puts doc.elements.map(&:name)

def foo(elements)
	elements.each do |element|
		puts element.name.attributes['name']

		foo(element.elements)
	end
end

foo (doc.elements)
