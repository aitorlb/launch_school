=begin
Rotation (Part 2)

Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

- Understand the problem
  - Input
    - 2 Integer numbers
      - First represents number to be rotated
      - Second represents last n digits of number
  - Output
    - New number in which the last n digits are rotated
  - Rules
    - Rotating just 1 digit results in the original number being returned.
    - You may assume that n is always a positive integer
    - Do not use the method Array#rotate or Array#rotate!

- Examples
  - Covered

- Algorithm
  - Method: rotate_array
    - slice first element in Array and assign to `first`
    - slice Array from index 1 to end and assign to `rest`
    - return `rest` + `first`

  - Method: rotate_rightmost_digits
    - If `last_n_digits` is 1
      - return input `number`
    - else
      - split `number` into `digits`
      - slice `digits` from beginning to (-1 * (`last_n_digits` + 1 ))
        and assign to `to_keep`
      - slice `digits` from (-1 * `last_n_digits)` to end and assign
        to `to_rotate`
      - call `rotate_array` with `to_rotate` and assign to `rotated`
      - assign `to_keep` + `rotated` to `result_array`
      - convert `result_array` into a number and assign to `result_number`
      - return `result_number`
  

- Code
=end

def rotate_array(array)
  first = array[0..0]
  rest  = array[1..-1]

  rest + first
end

def rotate_rightmost_digits(number, last_n_digits)
  return number if last_n_digits == 1

  digits = number.to_s.chars
  to_keep = digits[0..-(last_n_digits + 1)]
  to_rotate = digits[-last_n_digits..-1]
  rotated = rotate_array(to_rotate)
  result_array = to_keep + rotated
  result_number = result_array.join.to_i

  result_number
end

def rotate_rightmost_digits(number, last_n_digits)
  return number if last_n_digits == 1

  digits       = number.to_s.chars
  to_keep      = digits[0..-(last_n_digits + 1)]
  to_rotate    = digits[-last_n_digits..-1]
  result_array = to_keep + rotate_array(to_rotate)
  
  result_array.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
