require 'word_counter/parser'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebpageParser < Parser
    def parse(url)
      page = URI.parse(url)
      http = Net::HTTP.new(page.host, page.port)

      if page.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      contents = http.get(page.request_uri)
      text = Sanitize.clean(contents.body, remove_contents: %w(script))
      super text
    end
  end
end
