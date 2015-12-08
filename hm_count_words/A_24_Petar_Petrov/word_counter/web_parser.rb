require 'net/http'
require 'sanitize'
require_relative 'parser'
require 'openssl'

module WordCounter
  class WebpageParser < Parser
    def parse(uri)
      link = URI.parse(uri)
      http = Net::HTTP.new(link.host, link.port)
      if link.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      result = http.get(link.request_uri)
      text = Sanitize.fragment(result.body, :remove_contents => ['script'])
      super(text.downcase)
    end
  end
end
