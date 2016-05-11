# Create an service for checking the urls in c37

1. Create a service available at url
2. This url should accept a json file as ?json...
3. The format of the json file is the following

```
{
	"a": ...,
	"b": ...,
	"c": ...,
	"x1": ...,
	"x2": ...,
	"url": ...
}

```

4. An example for the json file is

```
{
	"a": 1,
	"b": 2,
	"c": 3,
	"x1": 4,
	"x2": 5,
	"url": https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/c37_url_tasks/A_24_Petar_Petrov.txt
}

5. The service must parse the file accessible on the url passed in the json file. Must take the first line from this file and make a GЕT request to this first url with the params:  "a","b","c". The url that has just been called returns a result "x1'" and "x2'"

6. The service must return:
 - 0
	if the result x1', x2' != x1, x2
 - 1
  if the result x1', x2' == x1, x2
 
# Steps to implements

1. Implement a service with Hook.io or WebTask.io available at a url
2. Pass a param "?json..." and return the content of this json
3. Pass a param "?json..." and return the values of "a","b","c","x1","x2","url"
4. Pass a param "?json..." and return the content of the file available at the passed "url"
5. Pass a param "?json..." and return the first line of the file available at the passed "url"
6. Pass a param "?json...", get the first line of the file available at the passed "url" and make a get request to this url with the params "a","b","c". 
7. Pass a param "?json...", get the first line of the file available at the passed "url", make a get request to this url with the params "a","b","c" and get the result "x1,x2" returned from the GET request.
8. Compare the result returned from the GET request with the passed "x1","x2" and return 0 or 1.
