# 2015-11-19

- parse websites
- sanitize html

## Overview

```
module WordCounter
    ::parse(string)
    ::parse_file(filename)
    ::parse_website(url)

    class Parser
        #parse(string)

    class FileParser < Parser
        #parse(filename)

    class WebParser < Parser
        #parse(url)

    class Result
```

## Dir structure

```
B_27_Radostin_Angelov
├── word_counter
│   ├── file_parser.rb
│   ├── parser.rb
│   ├── result.rb
│   └── web_parser.rb
└── word_counter.rb
```


## Starting the script

Example:

```
ruby -I B_27_Radostin_Angelov B_27_Radostin_Angelov.rb
```



