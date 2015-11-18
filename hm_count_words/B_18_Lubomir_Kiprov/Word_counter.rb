require "/home/lubo/Desktop/ruby/result.rb"
class WordCounter 
	private
	def parse(string)
		
		countwords = 0
		countmarks = 0
		index = 0
		wordhash = Hash.new 0

		searchword  =  string.tr("\n","")
		searchword = searchword .split(' ')
		searchword.each do |item|
			if  /[[:punct:]]/.match(item)
				countmarks = countmarks + 1	
				searchword[index] = item.gsub(/[[:punct:]]/, "")
				index = index + 1	
			else
				searchword[index] = item
				index = index + 1	
			end
		end
		searchword =  searchword.sort
		j = searchword.first
		searchword.each do |i|
	
			if i == j
				countwords = countwords + 1
				wordhash[j] = countwords
			else
				j = i
				countwords = 1
				wordhash[j] = countwords
			end
	
		end
		wordhash = wordhash.sort_by{|k, v| [-v, k]}
		
		
		Result.new(wordhash, countmarks)
	end
public
	def parse_file(path)
		my_array = ""
		File.open(path, "r").each_line do |line|
			my_array += " " + line.downcase
		end
		parse my_array
	end
end
