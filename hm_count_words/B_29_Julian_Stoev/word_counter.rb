require './B_29_Julian_Stoev/result.rb'
require 'net/http'
require 'sanitize'
require 'openssl'

class WordCounter
	
	def initialize
		@data = ""
	end
	
	def parse txt
		words_hash = Hash.new(0)

		sumofmarks = txt.scan(/[[:punct:]=`~$^+|<>]/u).length

		content = txt.downcase.tr('^A-Z ^0-9 ^a-z', ' ').split(' ')
		content.each do |word|
			words_hash[word] = words_hash[word]+1 
		end

		words_hash = words_hash.sort_by {|key, value| [-value, key]}	
		
		Result.new(words_hash, sumofmarks)
	end

	def parse_file file
		txtfile = File.open(file, "r")
		txt = IO.read(txtfile)
		parse txt
	end
	
	def parse_url url
		uri = URI.parse(url)
      		http = Net::HTTP.new(uri.host, uri.port)

		if uri.scheme == 'https'
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
     		end

      		result = http.get(uri.request_uri)
		txt = Sanitize.fragment(result.body)

		parse txt 
	end
	
	def parse_folder_data folder
		Dir.glob("#{folder}/*").each_with_object({}) do |obj, h|	
			if File.file?(obj)
				@data << File.read(obj)
			elsif File.directory?(obj)
				@data = parse_folder(obj)
			end							
		end
	end
	
	def parse_folder folder
		parse_folder_data(folder)
		parse(@data)
	end	
end


