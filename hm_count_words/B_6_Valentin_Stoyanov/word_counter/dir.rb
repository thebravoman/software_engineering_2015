module WordCounter
	class DirParser < FileParser
		def dir_parse(path)
			main = {}
			sum = 0
			res = Result.new
			Dir.glob(path + '*') do |f|
				if File.file? f
					res = file_parse(f)
					main.merge!(res.word_counts) {|key, oldval, newval| newval + oldval}
					sum += res.marks_count.to_i
				end
			end
			main = main.sort_by {|key, val| [-val, key] }
			res.word_counts = main
			res.marks_count = sum
			res.to_csv
		end
	end
end
