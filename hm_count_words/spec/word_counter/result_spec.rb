require 'word_counter'

describe WordCounter::Result.new do
  it { is_expected.to respond_to(:marks_count) }
  it { is_expected.to respond_to(:word_counts) }
  it { is_expected.to respond_to(:to_csv) }
  it { is_expected.to respond_to(:to_json) }
  it { is_expected.to respond_to(:to_xml) }    
end