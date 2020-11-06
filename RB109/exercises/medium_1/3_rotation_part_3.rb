=begin
Rotation (Part 3)

If you take a number like 735291, and rotate it to the left, you get 352917. If 
you now keep the first digit fixed in place, and rotate the remaining digits, 
you get 329175. Keep the first 2 digits fixed in place and rotate again to 
321759. Keep the first 3 digits fixed in place and rotate again to get 321597. 
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits 
to get 321579. The resulting number is called the maximum rotation of the 
original number.

Write a method that takes an integer as argument, and returns the maximum 
rotation of that argument. You can (and probably should) use the 
rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

- Understand the problem
  - Input
    - an Integer number
  - Output
    - an Integer number
      - the maximum rotation of the original number
  - Rules
    - Do not use the method Array#rotate or Array#rotate!
    - you do not have to handle multiple 0s

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
  
  - Method: max_rotation
    - assign input `number` to `max_rotation`
    - split `number` into Array of digits and assign its size to `size`
    - loop `size` times
      - call `rotate_rightmost_digits`
        with `number` and (`size` - current `index`)
        and assign to `max_rotation`
    - return `max_rotation`

- Code
=end

def rotate_array(array)
  first = array[0..0]
  rest  = array[1..-1]

  rest + first
end

def rotate_rightmost_digits(number, last_n_digits)
  return number if last_n_digits == 1

  digits       = number.to_s.chars
  to_keep      = digits[0..-(last_n_digits + 1)]
  to_rotate    = digits[-last_n_digits..-1]
  result_array = to_keep + rotate_array(to_rotate)
  
  result_array.join.to_i
end

def max_rotation(number)
  max_rotation = number
  size = number.to_s.chars.size

  size.times do |index|
    max_rotation = rotate_rightmost_digits(max_rotation, size - index)
  end

  max_rotation
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
