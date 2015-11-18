class WordCounter
    def parse_file(filename)
      parse(IO.read(filename).downcase)
    end
  
    def mark_count(text)
      text.count(",.?!():;\"\'/\\+=><*[]{}@|_#`&-")
    end
  
    def split_string(text)
      text.gsub(/(\/\\.+\/)|[^a-z\s_]/, ' ').split(' ')
    end
  
    def sort(words)
      unique_text = words.uniq.sort do |a, b|
        if words.count(a) == words.count(b)
          a <=> b
        else
          words.count(b) <=> words.count(a)
        end
      end
      unique_text
    end
  
    def parse(string)
      res = Result.new
      res.marks_count = mark_count(string)
      string_split = split_string(string)
      sorted = sort(string_split)
      res.words_count['marks'] = res.marks_count
      res.words_count['words'] = {}
      sorted.each do |word|
        res.words_count['words'][word] = string_split.count(word)
      end
      res
    end  
end
