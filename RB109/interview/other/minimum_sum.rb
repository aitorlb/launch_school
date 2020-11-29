=begin
Write a method that takes one argument, an array of integers.

The method should return minimum sum of 5 consecutive numbers in the array.

If the array contains less than 5 elements, the method should return nil.

Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

- Understand the problem
  - Input: Array of Integer elements
  - Output: Integer or nil
  - Rules:
    - return minimum sum of 5 consecutive numbers in the array.
    - return nil if input array contains less than 5 elements.
  
- Test cases
  - Well covered by examples.

- Mental model
  - check input array contains 5 or more elements
  - retun nil if false
  - iterate through array indexes
  - slice 5 elements starting from index
  - sum sliced elements
  - store sum
  - return lowest sum

- Algorithm
  Method: `minimum_sum`, args: `integers`
    - return nil if `integers` size is less than 5
    - assign empty Array to `sums`
    - assign Array of numbers from 0 up to (`integers` size - 5) to `indexes`
    - iterate through `indexes` as `idx`
      - slice `integers` from `idx` up to (but not including) (`idx` + 5) and assign to `slice`
      - add sum of `slice` to `sums`
    - return first element of sorted `sums` ascendingly

- Code
=end

NOT_FOUND = nil
LIMIT = 5

def minimum_sum(integers)
  return NOT_FOUND if integers.size < LIMIT
  
  sums = []
  indexes = (0..integers.size - LIMIT).to_a
  
  indexes.each do |idx|
    sums << integers[idx, LIMIT].sum
  end
  
  sums.sort.first
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
