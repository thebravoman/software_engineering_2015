module Word_counter
class Parser
$countmarks = 0
def parse(string)
		
		countwords = 0
		index = 0
		wordhash = Hash.new 0
		
		$countmarks += string.scan(/[[:punct:]=`~$^+|<>]/u).count
		searchword  =  string.gsub(/[[:punct:]=`~$^+|<>]/u, ' ').tr("\n",' ').downcase.split(' ').sort
		j = searchword.first
		
		searchword.each do |i|
			if i!=' '
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

		Result.new(wordhash, $countmarks)
	end
end
end
