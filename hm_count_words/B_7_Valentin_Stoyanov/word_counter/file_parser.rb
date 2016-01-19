require './B_7_Valentin_Stoyanov/word_counter/database'
module WordCounter
	class FileParser < Parser
		def file_parse filename
			filename = File.open(filename, 'r')
			file_content = filename.read
			result = parse file_content
			save_in_db filename, Digest::SHA256.file(filename).digest , result.word_counts, result.marks_count
			result
		end
	end
end
