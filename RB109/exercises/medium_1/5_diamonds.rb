require 'pry'

=begin
Diamonds!

Write a method that displays a 4-pointed diamond in an n x n grid, where n is 
an odd integer that is supplied as an argument to the method. You may assume 
that the argument will always be an odd integer.

Examples

diamond(1)

*
diamond(3)

 *
***
 *
diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

- Understand the problem
  - Input
    - Integer number
  - Output
    - Print to the screen
      - 4-pointed diamond in an n x n grid
  - Rules
    - the argument will always be an odd integer
    - output starts with empty line?

- Examples
  - Covered

- Algorithm
  Method: print_stars, args: `stars`, `spaces`
    - if `spaces` is not 0
      - print blank character times `spaces` / 2
      - print star character times `stars`
      - print blank character times `spaces` / 2
      - print end of line character
    - else
      - print star character times `stars`

  Method: calculate_stars, args: `n`
    - assign Array of odd numbers from 1 up to (but not included) `n` to `odds`
    - return `odds` + [`n`] + `odds` reversed

  Method: diamonds, args: `n`
    - call `calculate_stars` with `n` and assign to `stars_array`
    - loop over `stars_array`
      - assign `n` - `stars` to `spaces`
      - call `print_stars` with `odds` and `spaces`

- Code
=end

STAR  = "*"
SPACE = " "

def print_stars(stars, spaces)
  if spaces.zero?
    puts STAR * stars
  else
    spaces /= 2
    puts SPACE * spaces + STAR * stars + SPACE * spaces
  end
end

def calculate_stars(n)
  odds = (1...n).to_a.select(&:odd?) 

  odds + [n] + odds.reverse
end

def diamond(n)
  stars_array = calculate_stars(n)

  stars_array.each do |stars|
    spaces = n - stars

    print_stars(stars, spaces)
  end
end

diamond(1)

# *
diamond(3)

#  *
# ***
#  *
diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
