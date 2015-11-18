require './B_14_Ivo_Gerginov/result'

class WordCounter
  
  def parse f_str
  	w_count = Hash.new(0)
	  marks = 0
	  f_str.each_line do |line|
	    marks = line.scan(/[\p{P}\p{S}]/u).count
      line = line.gsub!(/[\W+_\d+]/, " ")
      line = line.downcase
      words = line.split(/\W+/)

      words.each{ |x|	
      	if w_count.has_key?("#{x}")
    	  w_count["#{x}"] += 1
      	else
          w_count["#{x}"] = 1
      	end
      }
    end
    return Result.new(marks, w_count)
  end

  def parse_file(f_path)
  	f = File.open(f_path, 'r')
	f = f.read
	parse f
  end

end