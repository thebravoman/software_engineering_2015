require 'word_counter'

describe WordCounter::Parser do
  describe '#parse' do
    it 'counts marks correctly' do
      parser = WordCounter::Parser.new
      result = parser.parse('kwenf!./,.ergrekpwd-')

      expect(result.marks_count).to eq(6)
    end
  end
end
