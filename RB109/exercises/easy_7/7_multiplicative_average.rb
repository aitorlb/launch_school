require 'pry'

=begin
Multiplicative Average

Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array, and
then prints the result rounded to 3 decimal places. Assume the array is
non-empty.

Examples:

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

- Understand the problem
  - Input
    - Array of Integer elements
  - Output
    - String with the multiplicative average
  - Rules
    - Assume the array is non-empty.
    - Multiply all the numbers together and divides the results by numbers
      count.
    - Result is rounded to 3 decimal places

- Examples
  - Covered by examples

- Mental model
  - 3 steps problem
    - Multiply all the numbers together
    - Divide multiplication by amount of numbers
    - Return result as String

- Algorithm
  1. Assign 1 to `multiplication`
  2. Assign size of `input_array` to `number_array_entries`
  3. Assign nil to `average`
  4. Iterate over `input_array`
    - multiply `current_number` by `muliplication`
    - assign result back to `multiplication`
  5. Divide `multiplication` by `number_array_entries` and assign to `average`
  6. Return average as String

- Code
=end

def show_multiplicative_average(input_array)
  multiplication = 1
  number_array_entries = input_array.size
  average = nil

  input_array.each do |current_number|
    multiplication = multiplication * current_number # *=
  end
  average = multiplication / number_array_entries.to_f
  rounded_average = sprintf("%.3f", average)

  "The result is #{rounded_average}"
end

puts show_multiplicative_average([3, 5]) == "The result is 7.500"
puts show_multiplicative_average([6]) ==  "The result is 6.000"
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) == "The result is 28361.667"

