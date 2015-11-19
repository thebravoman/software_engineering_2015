require 'open-uri'
require 'sanitize'

def remove_html_tags source
   re = /<("[^"]*"|'[^']*'|[^'">])*>/
   source.gsub!(re, '')
   source.gsub!(re, '')
   return source
end
url = ARGV[0]
source = open(url).read
source = Sanitize.fragment(source)
p  source
