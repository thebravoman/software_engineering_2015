require_relative 'result.rb'

module WordCounter
  class Parser
    def parse(string)
      result = Result.new
      result.markz_count = string.scan(/[^A-Za-z0-9_\s]/).count
      string = string.gsub(/[^A-Za-z0-9_]/, ' ').downcase
      string = string.split(" ")
      string.each do |word|
        result.wordsnum[word] = result.wordsnum[word] + 1
      end
      result.wordsnum = result.wordsnum.sort_by{|word, number| word.downcase}
      result.wordsnum = result.wordsnum.sort_by{|word, number| [-number,word]}
      result
    end
  end
end
