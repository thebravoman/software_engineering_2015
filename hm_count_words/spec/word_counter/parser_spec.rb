require 'word_counter'

describe WordCounter::Parser do
  describe '#parse' do
    it 'counts marks correctly' do
      parser = WordCounter::Parser.new

      result = parser.parse('Hello!!')

      expect(result.marks_count).to eq(2)
    end
  end
end
