=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

- Understand the problem
  - Input:  Integer
  - Output: Integer
  - Rules
    - Input is a positive integer number
    - Return the next bigger number formed by the same digits
    - If no bigger number can be composed using those digits, return -1

- Test cases
  - Well covered by examples.

- Mental model
  - Iterate through number
  - Swap two digits at a time starting from the end
  - Return swapped number if greater than number
  - Return -1

- Algorithm
  Method: `next_bigger_num`, args: `num`
    - assign -1 to NOT_FOUND
    - assign Array of `num` digits to `digits` 
    - assign (`digits` size - 1) to `last_index`
    - assign Array from `last_index` to 0 to `indexes`
    - iterate through `indexes` as `index`
      - assign `digits` with keys at `index` and (`index` - 1) swapped
        and joined together as a number to `swapped_digits`
      - return `swapped_digits` if gt `digits`
    - return `NOT_FOUND`

  Method: `swap_last_digits`, args: `num`
    - return 

- Code
=end

require 'pry'

NOT_FOUND = -1

def rotate_last_two(array)
  [*array[..-3], array[-1], array[-2]]
end

def next_bigger_num(num)
  digits  = num.to_s.chars
  indexes = (1..(digits.size - 1)).to_a.reverse

  indexes.each do |index|
    digits_to_keep   = digits[(index + 1)..]
    digits_to_rotate = digits[..index]
    rotated_digits   = rotate_last_two(digits_to_rotate)
    rotated_num      = (rotated_digits + digits_to_keep).join.to_i

    return rotated_num if rotated_num > num
  end

  NOT_FOUND 
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
