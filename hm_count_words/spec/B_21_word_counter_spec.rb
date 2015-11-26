require 'word_counter'

describe WordCounter::Parser do
  desctibe 'parses words' do
    it 'counts words' do
      parser = WordCounter::Parse.new
      result = parser.parse('Draco Dormenis Ninquam Titilandus!!')
      expect(result).to eq('Draco,1\nDormenis,1\nNinquam,1\nTitilandus,1\n"marks",2\n')
    end
    it 'counts only words' do
      parser = WordCounter::Parse.new
      result = parser.parse('Draco Dormenis Ninquam Titilandus')
      expect(result).to eq('Draco,1\nDormenis,1\nNinquam,1\nTitilandus,1\n')
    end
    it 'counts only marks' do
      parser = WordCounter::Parse.new
      result = parser.parse('!!')
      expect(result).to eq('"marks",2\n')
    end
    
     
  end
  
end
