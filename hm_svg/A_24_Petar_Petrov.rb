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
		@line_x_1 = 0
		@line_y_1 = 0
		@line_x_2 = 0
		@line_y_2 = 0
		@rect_width = 100
		@rect_height = 50
		@arr_index = 0
		@hash_index = 0
	end
	def generate_svg_tree(parsed)
		File.open("A_24_Petar_Petrov.svg", "w") do |svg_file|
			svg_file.write('<svg xmlns="http://www.w3.org/2000/svg">')
				
			iteration(parsed,svg_file)
			
			svg_file.write('</svg>')
		end
	end
	
	private
		def iteration(hash,file,arr_size=1,hash_size=1)
			if hash.is_a?(Hash)	
				hash.each_with_index do |(key, value), i|
						@hash_index = i	
						iteration(value,file,arr_size,hash.size)
				end
			elsif hash.is_a?(Array)
				hash.each_with_index do |el,arr_index|
					@arr_index = arr_index
					iteration(el,file,hash.size,hash_size)
				end
			else

				if hash_size == 1
					draw_rectangle(hash,file,arr_size,hash_size)
				else
					draw_circle(hash,file,arr_size,hash_size) 
				end
				draw_line(file)
			end
		end
		
		def draw_line(file)
			file.write('<line x1="'+@line_x_1.to_s+'" y1="'+@line_y_1.to_s+'" x2="'+@line_x_2.to_s+'" y2="'+@line_y_2.to_s+'" style="stroke:blue;stroke-width:2" />')
		end
		
		def draw_circle(parent,file,arr_size,hash_size)
			if(@c_counter > 0)
				if @hash_index == 0 && @arr_index == 0
					@line_x_1 = @initial_x - 30
					@line_y_1 = @initial_y + 28
					@initial_x -= 250*(arr_size-1)
					@initial_y += 100
					@line_x_2 = @initial_x + 35
					@line_y_2 = @initial_y
				elsif @arr_index > 0 && @hash_index == 0
					@line_x_1 = @initial_x - 20
					@initial_x += 2*200	
					@line_x_2 = @initial_x + 10		
				end
			end
			file.write('<circle cx="'+@initial_x.to_s+'" cy="'+@initial_y.to_s+'" r="'+@circle_radius.to_s+'" fill="'+@fill+'" stroke="'+@stroke_color+'" stroke-width="'+@stroke_width.to_s+'"/>')
			file.write('<text x="'+(@initial_x-26).to_s+'" y="'+(@initial_y+3).to_s+'">'+parent+'</text>')
			@c_counter = 1
		end
		
		def draw_rectangle(child,file,arr_size,hash_size)
				if @hash_index == 0 && @arr_index == 0
					@line_x_1 = @initial_x - 30
					@line_y_1 = @initial_y + 28
					@initial_x -= 100*(arr_size-1)
					@initial_y += 100
					@line_x_2 = @initial_x + 20
					@line_y_2 = @initial_y
				elsif @hash_index == 0 && @arr_index > 0
					@line_x_1 = @initial_x
					@initial_x += 150	
					@line_x_2 = @initial_x - 10	
				end		
			file.write('<rect x="'+@initial_x.to_s+'" y="'+@initial_y.to_s+'" width="'+@rect_width.to_s+'" height="'+@rect_height.to_s+'" fill="'+@fill+'" stroke="'+@stroke_color+'" stroke-width="'+@stroke_width.to_s+'"></rect>')
			file.write('<text x="'+(@initial_x+(100/child.length)).to_s+'" y="'+(@initial_y+30).to_s+'">'+child+'</text>')
		end
end

if ARGV[0].split(".").last == 'json'
	json = File.read(ARGV[0])
	SVG_Parser.new.generate_svg_tree(JSON.parse(json))	
end


