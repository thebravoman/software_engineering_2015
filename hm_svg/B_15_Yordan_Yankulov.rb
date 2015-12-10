require 'json'
require_relative 'B_15_Yordan_Yankulov/parsing_json'
require_relative 'B_15_Yordan_Yankulov/drawer'
require_relative 'B_15_Yordan_Yankulov/drawing_program'

file = File.read(ARGV[0])
my_hash = JSON.parse(file)
parsing my_hash,1
File.open('B_15_Yordan_Yankulov.svg','w') do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write(drawing_the_svg my_hash,0,SVGDrawer.new,String.new,1,0,0)
  f.write('</svg>')
end
