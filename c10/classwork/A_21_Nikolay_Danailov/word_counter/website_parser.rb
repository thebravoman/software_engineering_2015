require_relative 'parser.rb'

module WordCounter
  class WebsiteParser < Parser
    def parse(url)
      contents = File.read file
      super contents
    end
  end
end