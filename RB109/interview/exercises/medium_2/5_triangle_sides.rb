 require 'pry'

=begin
Triangle Sides

A triangle is classified as follows:

- equilateral: All 3 sides are of equal length
- isosceles: 2 sides are of equal length, while the 3rd is different
- scalene: All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must 
be greater than the length of the longest side, and all sides must have lengths 
greater than 0: if either of these conditions is not satisfied, the triangle is 
invalid.

Write a method that takes the lengths of the 3 sides of a triangle as 
arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
depending on whether the triangle is equilateral, isosceles, scalene, or 
invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

- Understand the problem
  - Input
    - 3 numbers
      - Integer or Float
      - represent sides of a triangle
  - Output
    - Symbol
      - one of :equilateral, :isosceles, :scalene, or :invalid
  - Rules
    - To be a valid triangle:
      - the sum of the lengths of the two shortest sides must be greater than 
        the length of the longest side
      - all sides must have lengths greater than 0
    - Valid triangles:
      - equilateral: All 3 sides are of equal length
      - isosceles: 2 sides are of equal length, while the 3rd is different
      - scalene: All 3 sides are of different length

- Test cases
  - Covered by examples

- Algorithm
  Method `valid_triangle?`, args: `sides`
    - return false unless all `sides` are greater than 0
    - sort `sides` from high to low
    - if the sum of two last elements in `sides` are greater than first element
      - return true
    - else
      - return false

  Method `triangle`, args: `a`, `b`, `c`
    - assign [`a`, `b`, `c`] to `sides`
    - return :invalid if call `valid_triangle?` with `sides` returns false
    - assign `sides.uniq` to `unique_sides`
    - if `unique_sides.size` is 1
      - return `:equilateral`
    - if `unique_sides.size` is 2
      - return `:isosceles`
    - elsif `unique_sides.size` is 3
      - return `:scalene`

- Code
=end

def valid_triangle?(sides)
  return false if sides.any?(&:zero?)

  sorted_sides = sides.sort.reverse
  longest_side = sorted_sides.first
  shortest_sides_sum = sorted_sides[1..2].sum

  longest_side < shortest_sides_sum
end


def triangle(a, b, c)
  sides = [a, b, c]

  return :invalid unless valid_triangle?(sides)

  case sides.uniq.size
  when 1
    :equilateral
  when 2
    :isosceles
  when 3
    :scalene
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
