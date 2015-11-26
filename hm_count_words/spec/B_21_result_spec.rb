require'word_counter'

define WordCounter::Result do
  describe 'results' do
    text = 'Draco Dormanis Ninquam Titilandus!!'
    result = WordCounter::Result.new
    it 'does csv' do      
      csv = result(WordCounter::Parse.new.parse(text)).to_csv 
      expect csv.to eql ('Draco,1\nDormenis,1\nNinquam,1\nTitilandus,1\n"marks",2\n')
    end
  end
end

