require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter

  class WebParser
  
    def parse_web (url)
      uri = URI.parse(url)
      source = Net::HTTP.new(uri.host, uri.port)
      if(uri.scheme == 'https')
        source.use_ssl = true
        source.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      result = source.get(uri.request_uri)
      text = Sanitize.fragment(result.body)
      Parser.new.parse_string text
    end
    
  end
  
end 
