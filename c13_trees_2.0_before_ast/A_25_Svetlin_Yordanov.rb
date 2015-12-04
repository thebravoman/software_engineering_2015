require 'rexml/document'
include REXML

file = File.new("A_25_Svetlin_Yordanov.xml")

xml_doc = Document.new(file)
svg_file = File.open("A_25_Svetlin_Yordanov.svg")

def circle x, y, r, cr, cg, cb
'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="red" style="fill:rgb('+cr.to_s+', '+cg.to_s+', '+cb.to_s+')"/>'
end

File.open("A_25_Svetlin_Yordanov.svg", "w") do |line|
	line.write('<svg xmlns="http://www.w3.org/2000/svg">')
	
	
	xml_doc.root.elements.each("school") do |school|
		puts school.attributes["name"]
		line.write(circle 100, 100, 100, 255, 255, 255)
	
		school.elements.each("class") do |school_class|
			puts "  " + school_class.attributes["name"]
			school_class.elements.each("student") do |student|
				puts "    " + student.text
			end
		end
	end
	
	line.write('</svg>')
end
