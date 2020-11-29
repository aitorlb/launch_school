=begin
Reverse an array without using the built-in reverse method.

- Understand the problem
  - Input: Array
  - Output: Array
  - Rules:
    - Cannot use #reverse method
    - Return new Array
    - Return same Array

- Test cases
  - reverse([1,2,3]) == [3,2,1]

- Mental model
  Return new Array
    - initialize empty results array
    - Iterate over input array from end to beggining
      - add element to results array

  Return same Array
    - find half point of array
    - iterate through array until half point
    - store left side element to replace
    - store right side element to replace
    - assign right side element to left side element index
    - assign left side element to right side element index

- ALgorithm
  Method: `new_reverse`, args: `array`
    - assign empty Array to `reversed_array`
    - assign Array of numbers from (but not including) `array` size down to 0
      and assign to `reverse_indexes`
    - iterate over `reverse_indexes` as `idx`
      - add `array` element at index `idx` to `reversed_array`
    - return `reversed_array`

  Method: `same_reverse`, args: `array`
    - assign (`array` size / 2) to `half_point`
    - assign Array of numbers from 0 up to (but not including) `half_point`
      and assign to `indexes`
    - iterate over `indexes` as `lside_idx`
      - assign `array` element at index `idx` to `lside_element`
      - assign (`array` size - 1) - `lside_idx` to `rside_index`
      - assign `array` element at index `rside_index` to `rside_element`
      - assign `rside_element` to array at index `lside_idx`
      - assign `lside_element` to array at index `rside_idx`
    - return`array`
- Code
=end

def new_reverse(array)
  reversed_array = []
  reverse_indexes = (array.size - 1).downto(0).to_a

  reverse_indexes.each do |idx|
    reversed_array << array[idx]
  end

  reversed_array
end

a = [1,2,3]
p new_reverse(a) == [3,2,1]
p new_reverse(a).object_id != a.object_id

def same_reverse(array)
  half_point = (array.size / 2)
  indexes    = (0...half_point).to_a

  indexes.each do |lside_idx|
    rside_idx = (array.size - 1) - lside_idx
    lside_element = array[lside_idx]
    rside_element = array[rside_idx]

    array[lside_idx] = rside_element
    array[rside_idx] = lside_element
  end

  array
end

a = [1,2,3]
p same_reverse(a) == [3,2,1]
p same_reverse(a).object_id == a.object_id
a = [0,1,2,3]
p same_reverse(a) == [3,2,1,0]
p same_reverse(a).object_id == a.object_id
