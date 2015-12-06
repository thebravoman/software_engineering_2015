require 'rexml/document'
include REXML

xml_file = File.open('A_05_Velin_Yavorski.xml')
xml_document = Document.new(xml_file)

xml_root = xml_document.root

xml_document.elements.each("School") do |school|
	puts school.attributes["name"]

	school.elements.each("Class") do |classes|
	puts "  " + classes.attributes["name"]
		classes.elements.each("Student") do |student|
			puts "    "  + student.text
		end
	end
end


def rect x, y, w, h
	'<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '"
	style="fill:rgb(100,0,0)" />'
end
	
def circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="red" />'
end

def line x1, y1, x2, y2
	'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />'
end

def text x, y, s
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+s.to_s+'</text>'
end


distance = 0

File.open('A_05_Velin_Yavorski.svg', "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	xml_document.elements.each("School") do |school|
		f.write(circle 500, 100, 70)
		f.write(text 480, 100, (school.attributes["name"]))
		school.elements.each("Class") do |classes|
			f.write(circle (330 + distance), 300, 50)
			f.write(text (310 + distance), 300, (classes.attributes["name"]))
			distance += 300
			f.write(line 300, 300, 500, 300)
		end
	end
	f.write('</svg>')
end











