=begin
Sum of Sums

Write a method that takes an Array of numbers and then returns the sum of the
sums of each leading subsequence for that Array. You may assume that the Array
always contains at least one number.

Examples:

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

- Understand the problem
  - Input
    - an Array of numbers
  - Output
    - a Number which is the sum of the sums of each leading subsequence for
      that Array.
  - Rules
    - the Array always contains at least one number.

- Examples
  - Covered

- Algorithm
  1. Assign 0 to `sum_of_sums`
  2. Iterate over `numbers`
    - Slice `numbers` up to current `index`
    - Sum elements in sliced array
    - Add new sum to `sum_of_sums`
  3. Return `sum_of_sums`

- Code
=end

# def sum_of_sums(numbers)
#   sum_of_sums = 0

#   numbers.each_with_index do |_, index|
#     subsequence = numbers[0..index]
#     sum_of_sums += subsequence.sum
#   end

#   sum_of_sums
# end

def sum_of_sums(numbers)
  numbers.each_with_index.inject(0) do |result, (_, index)|
    result += numbers[0..index].sum
    result
  end
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
