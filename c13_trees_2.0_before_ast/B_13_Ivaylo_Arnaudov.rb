require 'nokogiri'

# TODO: Try recursively with REXML at home
@doc = File.open("B_13_Ivaylo_Arnaudov.xml") { |f| Nokogiri::XML(f) }

puts @doc.xpath("/*/school/@name").to_s

classes = @doc.xpath("/*/school//class")

classes.each do |cls_node_set|
  puts "- #{cls_node_set.attr("name")}"
  students = cls_node_set.xpath("students/student");
  students.each do |student_node_set|
    puts "-- Name: #{student_node_set.attr("name")}" +
      " Age: #{student_node_set.attr("age")}"
  end
end
