require_relative 'parser.rb'
require 'net/http'
require 'openssl'
require 'sanitize'


module WordCounter
  class WebParser < Parser
    def parse(uri)
      uri = URI.parse(uri)
      http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      contents = http.get(uri.request_uri)
      text = Sanitize.clean(contents.body, remove_contents: %w(script, style))
      super (string)
    end
  end
end