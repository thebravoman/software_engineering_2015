require_relative './word_counter/parse'
require_relative './word_counter/result'

module WordCounter
  def self.parse(path)
    Parser.new.parse(path)
  end
end
