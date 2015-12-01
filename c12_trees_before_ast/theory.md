Working with tree data structure

# Class works
 - create a json file for containing the structure of School->Class->Student. Each school has many classes and each class has many students. Submit this file in the repo for the class work. Each school has name. Each class has name. Each student has name
  - create a program that parses the json file and outputs the following

```
SchoolName
  Class1
    Student1
    StudentN
  ClassN
		Student1
		StudentN
```

  - create a program that parses the json file and outputs and svg that is displaying the tree. Choose the form of the tree and how to display it.

# Homeworks

## Fix version1 to version 6 of the counting words.
Implement one program for version 6 that would be able to work of the 
 - input of V1 and produce the output of V1
 - input of V2 and produce the output of V2
 
 and so on till V6. 
 
This is a chance to fix the old programs.

### Deadline 
07 Dec 2015 22:00

## Draw a JSON tree in SVG - V1 of the homework
Implement a program that parse a tree structure persisted in a JSON format

Example is
```json
{
  "node_name" : "TUES",
  "children" : [
    { "node_name": "11a",
      "children" : [
                        {"node_name": "Aleksandar"},
                        {"node_name": "Andrea"},
                        {"node_name": "Antonio"}
    ]},
    { "node_name": "11b",
      "children" : [
                        {"node_name": "Asen"},
                        {"node_name": "Atanas"},
                        {"node_name": "Bojidar"}
    ]}
  ]
}
```

Create a program called Class_Number_FirstName_LastName.rb
Submit this program in hm_svg
The program accepts a file in json format as a command line argument.
The program produces an svg file called Class_Number_FirstName_LastName.svg 
The svg file displays the tree structure. Each node is a circle. Each leaf is a rectangle. 
The tree should be visible and clear. The design is up to you, but it should be easy to see the whole tree in the SVG file.

### Deadline
03 Dec 2015 22:00


