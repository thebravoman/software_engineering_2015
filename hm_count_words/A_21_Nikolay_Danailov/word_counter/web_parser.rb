require 'word_counter/parser'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebParser < Parser
    def self.parse(uri)
      uri = URI.parse(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      contents = http.get(uri.request_uri)
      text = Sanitize.clean(contents.body, remove_contents: ['script', 'style'])
      super text
    end
  end
end