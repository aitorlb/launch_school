require 'pry'

=begin
Right Triangles

Write a method that takes a positive integer, n, as an argument, and displays a
right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left of
the triangle, and the other end at the upper-right.

Examples:

triangle(5)

    *
   **
  ***
 ****
*****
triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Understand the problem
- input: Positive Integer
- output: displayed right triangle whose sides each have n stars
- rules:
  - The hypotenuse of the triangle should have one end at the lower-left of the
  triangle, and the other end at the upper-right

Test cases
- Well covered by examples

Describe Agorithm
- write method to calculate spaces
  - iterate 

Begin coding
=end

SPACE = " "
STAR  = "*"

def triangle(n)
  1.upto(n) do |i|
    spaces = SPACE * (n - i)
    stars  = STAR  * i

    puts spaces + stars
  end
end

triangle(5)
triangle(9)

