require 'json'

class SVG_Parser
	attr_accessor :initial_x, :initial_y
	def initialize	
		@initial_x = 600
		@initial_y = 50
		@circle_radius = 40
		@fill = 'white'
		@stroke_width = 2
		@stroke_color = 'black'
		@c_counter = 0
	end
	def generate_svg_tree(parsed)
		puts parsed
		File.open("A_24_Petar_Petrov.svg", "w") do |svg_file|
			svg_file.write('<svg xmlns="http://www.w3.org/2000/svg">')
				
				iteration(parsed,svg_file)
			
			svg_file.write('</svg>')
		end
	end
	
	private
		def iteration(hash,file,index=0)
			if hash.is_a?(Hash)		
				hash.each_with_index do |(key, value), i|
					if index == 1 && i == 0
						draw_circle(key,file,index)
					else
						draw_circle(key,file,i)
					end
					iteration(value,file) 
				end
			elsif hash.is_a?(Array)
				hash.each_with_index do |el,index|
					iteration(el,file,index)
				end
			end
		end
		
		def draw_circle(parent,file,index)
			if(@c_counter > 0)
				if index == 0
					@initial_x -= 100
					@initial_y += 100
				elsif index > 0
					@initial_x += 2*100			
				end
			end
			file.write('<circle cx="'+@initial_x.to_s+'" cy="'+@initial_y.to_s+'" r="'+@circle_radius.to_s+'" fill="'+@fill+'" stroke="'+@stroke_color+'" stroke-width="'+@stroke_width.to_s+'"/>')
			file.write('<text x="'+(@initial_x-26).to_s+'" y="'+(@initial_y+3).to_s+'">'+parent+'</text>')
			@c_counter += 1
		end
		
		def draw_rectangle(child,file)
			@initial_x -= 100
			@initial_y += 50
			file.write('<rect x="'+@initial_x.to_s+'" y="'+@initial_y.to_s+'" fill="'+@fill+'" stroke="'+@stroke_color+'" stroke-width="'+@stroke_width.to_s+'"></rect>')
			file.write('<text x="'+(@initial_x-26).to_s+'" y="'+(@initial_y+3).to_s+'">'+child+'</text>')
		end
end

if ARGV[0].split(".").last == 'json'
	json = File.read(ARGV[0])
	SVG_Parser.new.generate_svg_tree(JSON.parse(json))	
end


