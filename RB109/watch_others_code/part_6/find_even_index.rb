=begin
You are going to be given an array of integers. Your job is to take that array 
and find an index N where the sum of the integers to the left of N is equal to 
the sum of the integers to the right to N. If there is no index that would make 
this happen, return -1.

Examples:

find_even_index([1,2,3,4,3,2,1]) == 3
# [1,2,3].sum == [3,2,1].sum == 5

find_even_index([1,100,50,-51,1,1]) == 1
# [1].sum == [50,-51,1,1].sum == 1

find_even_index([1,2,3,4,5,6]) == -1
# not found

find_even_index([20,10,30,10,10,15,35]) == 3
# [20,10,30].sum == [10,15,35].sum == 50

find_even_index([20,10,-80,10,10,15,35]) == 0
# [].sum == [20,10,-80,10,10,15,35].sum == 0

find_even_index([10,-80,10,10,15,35,20]) == 6
# [10,-80,10,10,15,35].sum == [].sum == 0

find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
# [-1,-2,-3].sum == [-3,-2,-1].sum == 0

At index 0 the left side is []. Empty arrays are equal to 0 in this problem.

- Understand the problem
  - Input: Array of Integer elements
  - Output: Integer
  - Rules:
    - find an index N where the sum of the integers to the left of N is equal  
      to the sum of the integers to the right to N.
    - If there is no index that would make this happen, return -1.
    - At index 0 the left side is []. Empty arrays are equal to 0.

- Test cases
  - Well covered by examples.

- Mental model
  - iterate over input array indexes
  - slice left and right hand arrays
  - compare arrays
  - return index if arrays are equal

- Algorithm
  - Assign -1 to `NOT_FOUND`

  Method: `find_even_index`, args: `integers`
    - assign array of numbers from 0 up to `integers` size to `indexes`
    - iterate over `indexes` as `idx`
      - slice `integers` from beginning up to (but not including) `idx` and
        assign to `lside_integers`
      - slice `integers` from (but not including) idx up to end and
        assign to `rside_integers`
      - if `lside_integers` sum is eq `rside_integers` sum
        - return `idx`
      - else
        - continue iterating
    - return NOT_FOUND

- Code
=end

NOT_FOUND = -1

def find_even_index(integers)
  indexes = (0...integers.size).to_a

  indexes.each do |idx|
    lside_integers = integers[...idx]
    rside_integers = integers[(idx + 1)..]

    return idx if lside_integers.sum == rside_integers.sum
  end

  NOT_FOUND
end

p find_even_index([1,2,3,4,3,2,1]) == 3
# [1,2,3].sum == [3,2,1].sum == 5
p find_even_index([1,100,50,-51,1,1]) == 1
# [1].sum == [50,-51,1,1].sum == 1
p find_even_index([1,2,3,4,5,6]) == -1
# not found
p find_even_index([20,10,30,10,10,15,35]) == 3
# [20,10,30].sum == [10,15,35].sum == 50
p find_even_index([20,10,-80,10,10,15,35]) == 0
# [].sum == [20,10,-80,10,10,15,35].sum == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
# [10,-80,10,10,15,35].sum == [].sum == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
# [-1,-2,-3].sum == [-3,-2,-1].sum == 0
