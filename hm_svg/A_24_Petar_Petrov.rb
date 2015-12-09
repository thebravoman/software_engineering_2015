require 'json'

class SVG_Parser
	attr_accessor :initial_x, :initial_y, :line_x_1, :line_y_1, :line_x_2, :line_y_2
	def initialize	
		@initial_x = 500
		@initial_y = 50
		@circle_radius = 40
		@fill = 'white'
		@stroke_width = 2
		@stroke_color = 'black'
		@c_counter = 0
		@line_x_1 = 490 
		@line_y_1 = 55
		@line_x_2 = @line_x_1 + 20
		@line_y_2 = @line_y_1 + 20
		@rect_width = 100
		@rect_height = 50
	end
	def generate_svg_tree(parsed)
		File.open("A_24_Petar_Petrov.svg", "w") do |svg_file|
			svg_file.write('<svg xmlns="http://www.w3.org/2000/svg">')
				
			iteration(parsed,svg_file)
			
			svg_file.write('</svg>')
		end
	end
	
	private
		def iteration(hash,file,index=0,size=1)
			if hash.is_a?(Hash)	
				hash.each_with_index do |(key, value), i|	
					if index >= 1
						iteration(value,file,index,size) 
					else
						iteration(value,file,i,size) 
					end
					#draw_line(file)
				end
			elsif hash.is_a?(Array)
				hash.each_with_index do |el,arr_index|
					puts hash
					puts hash.size
					iteration(el,file,arr_index,hash.size)
				end
			else
				if index > 0
					draw_rectangle(hash,file,index)
				else
					draw_circle(hash,file,index) 
				end
			end
		end
		
		def draw_line(file)
			file.write('<line x1="'+@line_x_1.to_s+'" y1="'+@line_y_1.to_s+'" x2="'+@line_x_2.to_s+'" y2="'+@line_y_2.to_s+'" stroke-width="2"/>')
		end
		
		def draw_circle(parent,file,index)
			if(@c_counter > 0)
				if index == 0
					@initial_x -= 100
					@initial_y += 100
					@line_x_1 -= 100 + 10
					@line_y_1 += 100 + 5
					@line_x_2 += @line_x_1 + 20
					@line_y_2 += @line_y_1 + 20
				elsif index > 0
					@initial_x += 2*100	
					@line_x_1 += 2*100 - 10		
				end
			end
			file.write('<circle cx="'+@initial_x.to_s+'" cy="'+@initial_y.to_s+'" r="'+@circle_radius.to_s+'" fill="'+@fill+'" stroke="'+@stroke_color+'" stroke-width="'+@stroke_width.to_s+'"/>')
			file.write('<text x="'+(@initial_x-26).to_s+'" y="'+(@initial_y+3).to_s+'">'+parent+'</text>')
			@c_counter += 1
		end
		
		def draw_rectangle(child,file,index)
			if index == 0
					@initial_x -= 100
					@initial_y += 50
					@line_x_1 -= 100 + 10
					@line_y_1 += 100 + 5
					@line_x_2 += @line_x_1 + 20
					@line_y_2 += @line_y_1 + 20
				elsif index > 0
					@initial_x += 2*100	
					@line_x_1 += 2*100 - 10		
				end		
			file.write('<rect x="'+@initial_x.to_s+'" y="'+@initial_y.to_s+'" width="'+@rect_width.to_s+'" height="'+@rect_height.to_s+'" fill="'+@fill+'" stroke="'+@stroke_color+'" stroke-width="'+@stroke_width.to_s+'"></rect>')
			file.write('<text x="'+(@initial_x+(100/child.length)).to_s+'" y="'+(@initial_y+30).to_s+'">'+child+'</text>')
		end
end

if ARGV[0].split(".").last == 'json'
	json = File.read(ARGV[0])
	SVG_Parser.new.generate_svg_tree(JSON.parse(json))	
end


