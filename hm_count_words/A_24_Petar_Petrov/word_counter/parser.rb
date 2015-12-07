require_relative 'result'

module WordCounter
  class Parser 
      def mark_count(text)
        text.count(",.?!():;\"\'/\\+=><*[]{}@|_#`&-")
      end
    
      def split_string(text)
        text.gsub(/(\/\\.+\/)|[^a-z\s_0-9]/, ' ').split(' ')
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
        res.word_counts['marks'] = res.marks_count
        res.word_counts['words'] = {}
        sorted.each do |word|
          res.word_counts['words'][word] = string_split.count(word)
        end
        res
      end  
  end
end
