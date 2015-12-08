require 'rexml/document'
include REXML

file = File.new("A_15_Kalin_Karev.xml")

xml_doc = Document.new(file)

xml_doc.root.elements.each("school") do |school|
	puts school.attributes["name"]
	
	school.elements.each("class") do |school_class|
		puts "  " + school_class.attributes["name"]
	
	school_class.elements.each("student") do |student|
		puts "    " + student.text	
	end
		
	end 
end

def circle x, y, r, cr, cg, cb
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="red" stroke-width="3" fill="red" style="fill:rgb('+cr.to_s+', '+cg.to_s+', '+cb.to_s+')"/>'
end

File.open("A_15_Kalin_Karev.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	
		f.write(circle 450, 80, 60, 255, 255, 0)
		f.write(circle 200, 250, 50, 255, 255, 0)
		f.write(circle 900, 250, 50, 255, 255, 0)
	
	f.write('</svg>')
end
