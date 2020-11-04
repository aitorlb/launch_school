=begin
Name Swapping

Write a method that takes a first name, a space, and a last name passed as a 
single String argument, and returns a string that contains the last name, a 
comma, a space, and the first name.

Examples:

swap_name('Joe Roberts') == 'Roberts, Joe'

- Understand the problem
  - Input
    - a String
    - containing a first name, a space, and a last name
  - Output
    - a String
    - contains the last name, a comma, a space, and the first name
  - Rules

- Examples
  - Covered

- Algorithm
  - split input `string` into `words`
  - if `words` size is 2
    - assign first element in `words` to `first_name`
    - assign second element in `words` to `last_name`
    - return (`last_name` + ", " + `first_name`)
  - else
   - return "Invalid input: must provide a first name and a last name separated 
     by a space."

- Code
=end

def swap_name(string)
  words = string.split

  if words.size == 2
    first_name = words.first
    last_name = words.last

    "#{last_name}, #{first_name}"
  else
    "Invalid input: must provide a first name and a last name separated by a space."
  end
end

ERROR = "Invalid input: must provide a first name and a last name separated by a space."

def swap_name(string)
  words = string.split

  return ERROR unless words.size == 2

  first_name = words.first
  last_name  = words.last

  "#{last_name}, #{first_name}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
