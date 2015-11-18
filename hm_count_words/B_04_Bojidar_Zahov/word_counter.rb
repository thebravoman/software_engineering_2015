require './B_04_Bojidar_Zahov/result'
class WordCounter
  def parse_file(path)
    list = Hash.new
    pathern = path
    file=File.open(pathern)
    file = file.read
    marks = file.gsub(/[^[^a-zA-Z0-9]]/,"").split.join('').length
    file.each_line do |line|
   
     words = line.downcase.gsub(/[\W\d_]/,' ').split.each do |word|
       if list.has_key?(word)
            list[word] = list[word] + 1
        else
            list[word] = 1
        end
     end
    end
    list = list.sort{ |a,b| b[1] <=> a[1] }
    return parse_result = Result.new(list,marks)
end
     def parse(str)
		list = Hash.new
		marks = str.gsub(/\w/,"").split.join('').length
		str.each_line do |line|
			words = line.downcase.gsub(/\W/,' ').split.each do |word|
				if words.match(word)
					words[word]+= 1
				else
					words[word]= 1
				end
			end
		end
		words = words.sort{ |a,b| b[1] <=> a[1] }
		return parse_result = Result.new(words,marks)
	end
end
