require './B_15_Yordan_Yankulov/result.rb'
class WordCounter

	def parse(string)
      help = Hash.new
      punctuation = 0
      string.each_line{ |line|
      the_words = line.downcase.split
      the_words.each { |words|
        punctuation += words.count(".,!?:@;-_'\"[]()„“*/\{}#")
        words = words.gsub(/[,<>()@!.?_"]{}#/,'')
        if help.has_key?(words)
          help[words] = help[words] + 1
        else
          help[words] = 1
        end
      }
      my_help = help.sort {|first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1])}
      return Result.new(punctuation, my_help)
    }
	end
	def parse_file(filename)
    result = File.open(filename,"r")
    result = result.read
    parse result
	end
end
