# JSON & XML (2015-10-29)

- http://ruby-doc.org/stdlib-2.2.3/libdoc/json/rdoc/JSON.html
- http://ruby-doc.org/stdlib-2.2.3/libdoc/rexml/rdoc/REXML/Document.html
- http://ruby-doc.org/stdlib-2.2.3/libdoc/rexml/rdoc/REXML/Element.html
- https://github.com/bbatsov/rubocop

## Homework

You have to update your `hm_count_words` scripts so that they could produce
either a `csv` (they do this now), a `json` or an `xml` output based on argument passed to your script.

Expect your scripts to be called like this:

    ruby <program> <file-name>
    ruby <program> <file-name> <format>

The format could be  `csv`, `json`, `xml`. If there isn't a format or the format is not one of the trio use `csv`.

### JSON output template

For a file containing:

    hello world, la la la

You will have to output a valid `json` like the following:

```json
{
    "marks": 1,
    "words": [
        ["la", 3],
        ["hello", 1],
        ["world", 1]
    ]
}
```

The words are in descending order.

### XML output template

For a file containing:

    hello world, la la la

You will have to output a well formed `xml` like the following:

```xml
<word-counts>
    <marks>1</marks>
    <words>
        <word value="3">la</word>
        <word value="1">hello</word>
        <word value="1">world</word>
    </words>
</word-counts>
```

The words are in descending order.

### CSV format

The same as before.

### Deadline

2015-11-02 22:00
