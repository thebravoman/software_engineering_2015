require_relative 'result'
require_relative 'parser'

module WordCounter
	class FolderParser < Parser
		def parse(folder)
			result = Result.new
			result.word_counts['marks'] = 0
			result.word_counts['words'] = {}
			Dir.glob(folder+"**/"+"*").each do |file|
				if File.file?(file)
					hash = super(File.read(file).downcase)
					result.marks_count += hash.marks_count
					result.word_counts['marks'] += hash.word_counts['marks']
					result.word_counts['words'].merge!(hash.word_counts['words']) {|key, a, b| a + b }
				end
			end	
			result.word_counts['words'] = result.word_counts['words'].sort_by { |key, value|
				[-value, key] }.to_h
			result
		end
	end
end
