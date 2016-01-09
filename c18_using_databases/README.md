# Homework

## V8 of counting words

Save the info gathered by the `hm_count_words` scripts in a sqlite3 database.

* https://rubygems.org/gems/sqlite3
* https://lagunita.stanford.edu/courses/DB/2014/SelfPaced/about

Name the database file like this: `Class_Number_FirstName_LastName.db` e.g. `C_01_Ivan_Ivanov.db`

Use the table schemas that we used in class:

```
statistics
  - id           integer pk
  - source_name  string # this is the filename or the url of the website
  - hash         string # this is hash for the content, so that one can check if he has already processed it. http://ruby-doc.org/stdlib-2.2.3/libdoc/digest/rdoc/Digest.html

word_counts
  - statistic_id integer
  - word         string
  - count        integer
```

* Do not commit your .db files
* Make sure that your scripts create the database and the needed tables if they don't exist
* Save the count of the marks as a word -> `$marks$`
* Get the information about the word counts from the database if it's already present there.

## Deadline

13 Jan 2016 22:00
