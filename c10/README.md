# 2015-11-19

## Parsing Webpages & Sanitizing HTML

``` ruby
require 'net/http'
require 'sanitize'
require 'openssl'

uri  = URI.parse(ARGV.first)

http = Net::HTTP.new(uri.host, uri.port)

if uri.scheme == 'https'
  http.use_ssl = true

  # This is bad..
  # http://stackoverflow.com/questions/9199660/why-is-ruby-unable-to-verify-an-ssl-certificate#answer-9238221
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
end

result = http.get(uri.request_uri)

text = Sanitize.fragment(result.body)

puts text
```

- If you have a problem with the sanitize gem, the problem is probably from the nokogiri gem. Here you can see how to install the nokogiri: http://www.nokogiri.org/tutorials/installing_nokogiri.html When done, you should be able to install the sanitize gem.

## Bonus Problems

### Ignore Text In `<script>` Tags

Play a bit with the `sanitize` gem and find a way to remove the content of `<script>` tags.

### Tests For hm_count_words

Write some tests for the `hm_count_words`.
Put them, for example, in `hm_count_words/test/word_counter_test.rb` or `hm_count_words/test/word_counter/parser_test.rb`.

**Don't forget to give instructions on how to run the tests.**
(most probably it will run the tests for a single class/module like this `ruby -I hm_count_words/B_52_Ivan_Ivanov/ hm_count_words/test/word_counter_test.rb`)

p.s. If you want to use `rspec` gem instead of `minitest` use `spec` instead of `test` in the filenames: `hm_count_words/spec/word_counter_spec.rb` or `hm_count_words/spec/word_counter/parser_spec.rb`.

p.s.2.0. Test only the public interface that is described in the homework overview.

## Homework

Change your hm_count_words scripts so that they can parse webpages and refactor your code in a gem-like manner.

### Overview

```
module WordCounter
    ::parse(string)        → Result
    ::parse_file(filename) → Result
    ::parse_webpage(url)   → Result

    class Parser
        #parse(string)     → Result

    class FileParser < Parser
        #parse(filename)   → Result

    class WebpageParser < Parser
        #parse(url)        → Result

    class Result
        #marks_count       → Fixnum
        #word_counts       → Hash
        #to_csv            → String
        #to_json           → String
        #to_xml            → String
```

#### Notes on methods

- `::parse_file(filename)` means that this is a class method a.k.a we call it like this `WordCounter.parse_file('my-cool-file.txt')`
- `#parse(url)` means that this is an instance method a.k.a. we call like this `WordCounter::WebpageParser.new.parse('https://en.wikipedia.org/')`

``` ruby
module MyCoolGem
  def self.yet_another_class_method
    'hello'
  end

  class Foo
    def self.hi
      'This is a class method'
    end

    def hello
      'This is an instance method'
    end
  end
end

puts MyCoolGem::Foo.hi

puts MyCoolGem::Foo.new.hello

puts MyCoolGem.yet_another_class_method
```

### Dir Structure

Example:

```
B_52_Ivan_Ivanov.rb
B_52_Ivan_Ivanov
├── word_counter
│   ├── file_parser.rb
│   ├── parser.rb
│   ├── result.rb
│   └── webpage_parser.rb
└── word_counter.rb
```

### Notes on require

In your script (the `B_52_Ivan_Ivanov.rb` in the example) you should be able to require your library with a single line like this: `require 'word_counter'`

- http://fmi.ruby.bg/lectures/08-exceptions-require-gems#37

### Starting The Script

```
ruby -I B_52_Ivan_Ivanov/ B_52_Ivan_Ivanov.rb 'input.txt'
ruby -I B_52_Ivan_Ivanov/ B_52_Ivan_Ivanov.rb 'input.txt' 'xml'
ruby -I B_52_Ivan_Ivanov/ B_52_Ivan_Ivanov.rb 'https://en.wikipedia.org/wiki/Ruby'
ruby -I B_52_Ivan_Ivanov/ B_52_Ivan_Ivanov.rb 'https://en.wikipedia.org/wiki/Ruby' 'json'

ruby -I <your-dir> <program> <filename>
ruby -I <your-dir> <program> <filename> <format>
ruby -I <your-dir> <program> <url>
ruby -I <your-dir> <program> <url> <format>
```

**To determine if you have a filename or url, check if the string starts with 'http://' or 'https://'**

### Deadline

2015-11-23 22:00
