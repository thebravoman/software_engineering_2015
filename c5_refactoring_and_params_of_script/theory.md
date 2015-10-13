#Refactoring
Improving the structure and design of existing code without changing its behaviour

## Extract method
Extract behaviours into methods from a2_check.

 - sort_result
 - is_file_checked - extract methods
 - is student checked - rename methods
 - student_checked
 - add question mark because of convention
 - solved? expected, result -> because of extacting of behaviour
 - get_names
 - valid_names?
 - remove_file_ext

## Make the program work for both homeworks - quadratic and count words

This is how it should be executed for quadratic

> ruby a2_check.rb ../hm_quadratic_equation/ 1 4 2 -3.414213562373095,-0.5857864376269049

This is how it should be executed for count_words

> ruby a2_check.rb ../hm_count_words/ file.txt a,1dd,2

 
 
