=begin
Grade book

Write a method that determines the mean (average) of the three scores passed to 
it, and returns the letter value associated with that grade.

Numerical Score Letter  Grade
90 <= score <= 100      'A'
80 <= score < 90	      'B'
70 <= score < 80	      'C'
60 <= score < 70	      'D'
0 <= score < 60	        'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Example:

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

- Understand the problem
  - Input
    - 3 numbers
      - representing scores
  - Output
    - a String
      - letter value associated with that grade
  - Rules
    - Scores are all between 0 and 100.

- Examples
  - Covered

- Algorithm
  - Divide the sum of 3 score arguments by 3 and assign to `average_score`
  - if `average_score` is greater or equal than 90
    - return "A"
  - else if `average_score` is greater or equal than 80
    - return "B"
  - else if `average_score` is greater or equal than 70
    - return "C"
  - else if `average_score` is greater or equal than 60
    - return "D"
  - else
    - return "F"

- Code
=end

def get_grade(*scores)
  average_score = scores.sum / scores.size

  if average_score >= 90
    "A"
  elsif average_score >= 80
    "B"
  elsif average_score >= 70
    "C"
  elsif average_score >= 60
    "D"
  else
    "F"
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
