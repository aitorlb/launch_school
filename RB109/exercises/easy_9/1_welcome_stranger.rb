=begin
Welcome Stranger

Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces, will 
produce a person's name. The hash will contain two keys, :title and 
:occupation, and the appropriate values. Your method should return a greeting 
that uses the person's full name, and mentions the person's title and 
occupation.

Example:

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

- Understand the problem
  - Input
    - 2 arguments: an array and a hash.
      - an Array containing 2 or more elements
      - The hash will contain two keys, :title and :occupation
  - Output
    - A String representing a greeting that uses the person's full name, and 
      mentions the person's title and occupation.
  - Rules
    - Combined with adjoining spaces, the Array elements will produce a 
      person's name

- Examples
  - Covered

- Algorithm
  1. Join Array elements into String with blank character as delimiter
     and assign to `name`
  2. Interpolate name and Hash keys in greeting String 

- Code
=end

def greetings(array, hash)
  name       = array.join(" ")
  title      = hash[:title]
  occupation = hash[:occupation]

  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

puts greetings(
  ['John', 'Q', 'Doe'],
  { title: 'Master', occupation: 'Plumber' }
) == "Hello, John Q Doe! Nice to have a Master Plumber around."
