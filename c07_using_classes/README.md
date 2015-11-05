# 2015-10-05

- https://help.github.com/articles/generating-ssh-keys/
- използвайте password manager
- https://github.com/bliof/ruby-lectures/blob/elsys/lectures/02-classes-and-modules.slim
- или http://fmi.ruby.bg/lectures/04-procs-classes-modules-enumerable#32

## Homework

Използвайте класове за да реализирате `hm_count_words`.

Реализирайте поне следния интерфейс:

```
WordCounter
    #parse(string)        → Result
    #parse_file(filename) → Result

Result
    #marks_count → Fixnum    - броят пунктуационни знаци
    #word_counts → Hash      - клучове - думите от текста, стойности - колко пъти се срещат
    #to_csv      → String    - репрезентация като csv  – текст
    #to_json     → String    - репрезентация като json - текст
    #to_xml      → String    - репрезентация като xml  - текст
```

С други думи с тези класове трябва да може да се работи така:

```
word_counter = WordCounter.new

result = word_counter.parse_file('/home/test/file.txt')

puts result.marks_count # принтира броя пунктуационни знаци

puts result.to_xml      # принтира резултата като xml
```

- Добавяте си каквито искате помощни методи, но предпочитайте `private` методи.
- Скриптът Ви трабва да [работи както преди](c06_json_and_xml/README.md).

## Deadline

2015-11-09 22:00
