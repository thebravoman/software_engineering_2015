require 'word_counter/parser'

require 'net/http'
require 'sanitize'
require 'openssl'


module WordCounter
	class WebpageParser < Parser
    		def parse(url)
      			url = URI.parse(url)
      			http_client = Net::HTTP.new(url.host, url.port)

      			if url.scheme == 'https'
        			http_client.use_ssl = true
        			http_client.verify_mode = OpenSSL::SSL::VERIFY_NONE 
      			end

      			contents = http_client.get(url.request_uri) 
      			sanitized_content = Sanitize.clean(contents.body,
                     remove_contents: %w(script))

      			words = Hash.new(0)
      			max_marks = 0

      			sanitized_content.each_line do |line|
        			result = super(line)
        			words = words.merge(result.word_counts.to_h) { |key, ov, nv| ov + nv }
        			max_marks += result.marks
      			end

      			sorted_words = words.sort_by { |word, occurence| [-occurence, word] }
      			Result.new(sorted_words, max_marks)
    		end
    	end
end
