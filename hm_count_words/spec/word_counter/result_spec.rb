require 'word_counter'

describe 'Result' do
  res = WordCounter::Result.new
  it { expect(res).to respond_to(:marks_count) }
  it { expect(res).to respond_to(:word_counts) }
  it { expect(res).to respond_to(:to_csv) }
  it { expect(res).to respond_to(:to_json) }
  it { expect(res).to respond_to(:to_xml) }    
end