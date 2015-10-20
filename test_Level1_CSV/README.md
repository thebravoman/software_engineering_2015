# Tests

## Generating tests

> ruby generate.rb

This will produce two folders, named "tests" and "expects". The test folder contains the tests for the students. The "expects" contains the expected output of the program that they should develope.

## Evaluation tests

> ruby run_scripts_agains_fixtures.rb {folder_with_results} {folder_with_fixtures}

 - {folder_with_results} A folder container "results", "expected", "tests". This is the folder for the class
 - {folder_with_fixture} A folder with the fixtures. this is the generation folder
