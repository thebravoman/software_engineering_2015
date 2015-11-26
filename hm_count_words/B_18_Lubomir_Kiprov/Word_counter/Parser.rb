module Word_counter
class Parser
def parse(string)
		
		countwords = 0
		countmarks = 0
		index = 0
		wordhash = Hash.new 0
		
		countmarks = string.scan(/[[:punct:]=`~$^+|<>]/u).count
		searchword  =  string.tr("\n","")
		searchword = searchword .split(' ')
		searchword =  searchword.sort
		j = searchword.first
		
		searchword.each do |i|
			newstr = ""
			if i.match(/[[:punct:]=`~$^+|<>]/u)
				i.each_char{ |c|
				if !c.match(/[[:punct:]=`~$^+|<>]/u)
				newstr = newstr + c
				end}
				
				i = newstr
				
			end
			if i!=''
			if i == j
				countwords = countwords + 1
				wordhash[j] = countwords
			else
				j = i
				countwords = 1
				wordhash[j] = countwords
			end
			end
		end
		wordhash = wordhash.sort_by{|k, v| [-v, k]}
		
		
		Result.new(wordhash, countmarks)
	end
end
end

