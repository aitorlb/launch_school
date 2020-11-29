 require 'pry'

=begin
Tri-Angles

A triangle is classified as follows:

- right  => One angle of the triangle is a right angle (90 degrees)
- acute  => All 3 angles of the triangle are less than 90 degrees
- obtuse => One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and 
all angles must be greater than 0: if either of these conditions is not 
satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns 
a symbol :right, :acute, :obtuse, or :invalid depending on whether the 
triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating 
point errors. You may also assume that the arguments are specified in degrees.

Examples:

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

- Understand the problem
  - Input
    - 3 numbers
      - Integer
      - represent angles in degrees of a triangle
  - Output
    - Symbol
      - one of :right, :acute, :obtuse, or :invalid
  - Rules
    - To be a valid triangle:
      - the sum of the angles must be exactly 180 degrees
      - all angles must be greater than 0
    - Valid triangles:
      - right  => One angle of the triangle is a right angle (90 degrees)
      - acute  => All 3 angles of the triangle are less than 90 degrees
      - obtuse => One angle is greater than 90 degrees.

- Test cases
  - Covered by examples

- Algorithm
  Method `valid_triangle?`, args: `angles`
    - return false unless all `angles` are greater than 0
    - compare the sum of all elements in `angles` to 180

  Method `triangle`, args: `a`, `b`, `c`
    - assign [`a`, `b`, `c`] to `angles`
    - return `:invalid` if call `valid_triangle?` with `angles` returns false
    - if one element in `angles` is eq to 90
      - return `:right`
    - if all element in `angles` are less than 90
      - return `:acute`
    - if one element in `angles` greater than 90
      - return `:obtuse`

- Code
=end

def valid_triangle?(angles)
  return false if angles.any?(&:zero?)

  angles.sum == 180
end

def triangle(a, b, c)
  angles = [a, b, c]

  return :invalid unless valid_triangle?(angles)

  if angles.all?    { |angle| angle < 90 }
    :acute
  elsif angles.one? { |angle| angle == 90 }
    :right
  elsif angles.one? { |angle| angle > 90 }
    :obtuse
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
