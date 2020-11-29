=begin
Double Doubles

A double number is a number with an even number of digits whose left-side 
digits are exactly the same as its right-side digits. For example, 44, 3333, 
103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless 
the argument is a double number; double numbers should be returned as-is.

Examples:

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

Note: underscores are used for clarity above. Ruby lets you use underscores 
when writing long numbers; however, it does not print the underscores when 
printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

- Understand the problem
  - Input
    - Integer number
  - Output
    - Integer number
  - Rules
    - returns 2 times the number provided as an argument
    - double numbers should be returned as-is

- Examples
  - Covered

- Algorithm
  Method: double_number?
    - Convert input `number` to String and assign to `sring_num`
    - if `sring_num` size is odd
      - Return `false`
    - else
      - assign (`string_num` length / 2) to `half_point`
      - slice `string_num` from beggining up to (`half_point` - 1) and assign to
        `first_half`
      - slice `string_num` from `half_point` up to end assign to `second_half`
      - Compare `first_half` to `second_half`

  Method: twice?
    - call `double_number?` with input `number`
      - if true
        - return `number`
      - else
        - return `number` times 2

- Code
=end

def double_number?(number)
  string_num = number.to_s

  if string_num.size.odd?
    false
  else
    half_point = string_num.size / 2
    first_half = string_num[..(half_point - 1)]
    second_half = string_num[half_point..]
    
    first_half == second_half
  end
end

def twice(number)
  if double_number?(number)
    number
  else
    number * 2
  end
end

puts "Method: double_number?"
puts double_number?(2) == false
puts double_number?(22) == true

puts "\nMethod: twice"
puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
