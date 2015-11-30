module WordCounter
	class SVGParser
		def self.create_graph(words_hash)
			bar_width = 50
			counter = 1
			x_distance_coordinator = 20
			y_distance_coordinator = 210
			space_between_bars = 60
			
			File.open('A_24_Petar_Petrov.svg', 'w') do |svg_file|
				svg_file.write('<svg xmlns="http://www.w3.org/2000/svg">')
				words_hash['words'].each do |word, count|
					bar_height = 10*count
					if counter > 1
						x_distance_coordinator += (bar_width + space_between_bars)
					end
					if counter % 11 == 0
						y_distance_coordinator += 210
						x_distance_coordinator = 20
					end
					svg_file.write('<text x="'+(x_distance_coordinator+15).to_s+'" y="'+(y_distance_coordinator-bar_height-2).to_s+'">'+count.to_s+'</text>')
					svg_file.write('<rect x="'+x_distance_coordinator.to_s+'" y="'+(y_distance_coordinator-bar_height).to_s+'" width="'+bar_width.to_s+'" height="'+bar_height.to_s+'" style="fill:lightblue;stroke-width:3;stroke:red;opacity:0.7"></rect>')
					svg_file.write('<text x="'+x_distance_coordinator.to_s+'" y="'+(y_distance_coordinator+bar_height/count+5).to_s+'">'+word+'</text>')
					counter += 1
				end
				svg_file.write('</svg>')
			end
		end
	end
end
