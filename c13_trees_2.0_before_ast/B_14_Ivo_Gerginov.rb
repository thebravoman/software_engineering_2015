require 'rexml/document'
include REXML

xmlfile = File.open("B_14_Ivo_Gerginov.xml")
xmldoc = Document.new(xmlfile)


# This will output all the movie titles.
xmldoc.elements.each("School"){ 
   |e| puts "Movie Title : " + e.attributes["name"] 
   # This will output all the movie types.
xmldoc.elements.each("Class") {
   |e| puts "Movie Type : " + e.attributes["name"] 

   # This will output all the movie description.
xmldoc.elements.each("Student") {
   |e| puts "Movie Description : " + e.text 
}
}


}

