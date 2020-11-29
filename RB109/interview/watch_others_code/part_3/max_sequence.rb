=begin
The maximum sum subarray problem consists in finding the maximum sum of the 
contigious subsequence in an array of integers:

max_sequence of: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
should be: 6
because it's the sum of: [4, -1, 2, 1]

If the array is made up of only negative numbers, return 0 instead.

Empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray.

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

- Understand the problem
  - Input:  Array of Integer elements
  - Output: Integer
  - Rules
    - Empty array is considered to have zero greatest sum
    - Empty array is also a valid subarray
    - If input array is made up of only negative numbers, return 0
    - Find the maximum sum of the contigious subsequence in an array of integers

- Test cases
  - Well covered by examples.

- Mental model
  - keep track of sum
  - iterate over array indexes
    - slice array from current index

- Algorithm
  Method: `max_sequence`, args: `integers`
    - if all `integers` are positive
      - return `integers` sum 
    - else if all `integers` are negative
      - return 0 
    - else
      - assign 0 to `greatest_sum`
      - assign Array of numbers from 0 to (`integers` size - 1) to `indexes`
      - iterate over `indexes` as `start_idx`
        - iterate over `indexes` from `start_idx` to the end as `end_idx`
        - slice `integers` from `start_idx` to `end_idx`, sum its elements, and assign
          to `sum`
        - if `sum` is gt `greatest_sum`
          - assign `sum` to `greatest_sum`
        - else
          - continue to next iteration
        - return `greatest_sum`

- Code
=end
require 'pry'

def max_sequence(integers)
  return integers.sum if integers.all?(&:positive?)
  return 0            if integers.all?(&:negative?)

  greatest_sum = 0
  indexes = (0..(integers.size - 1)).to_a

  indexes.each do |start_idx|
    indexes[start_idx..].each do |end_idx|
      sum = integers[start_idx..end_idx].sum

      greatest_sum = sum if sum > greatest_sum
    end
  end

  greatest_sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
