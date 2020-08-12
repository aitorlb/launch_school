=begin
Alphabetical Numbers

Write a method that takes an Array of Integers between 0 and 19, and returns an
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

Understand the problem
  -input
    - array of integers
      - between 0 and 19
  - output
    - array of integers
      - sorted based on the English words for each number

Test cases
  - alphabetic_number_sort((0..2).to_a) == [1, 2, 0]

Describe algorithm
  - initialize hash
    - Integers => English words for given number
  - initialize array of english words
    - iterate over array of numbers
      - map integer to word
  - sort array of words
  - initialize array of sorted integers
    - iterate over array of numbers
    - map integer to word

Begin coding
=end

NUMBERS_IN_ENGLISH =  %w(
  zero one two three four
  five six seven eight nine
  ten eleven twelve thirteen fourteen
  fifteen sixteen seventeen eighteen nineteen
)

INTEGERS = (0..19).to_a

INTEGER_TO_WORD = INTEGERS.zip(NUMBERS_IN_ENGLISH).to_h


def alphabetic_number_sort(integers)
  integers.sort_by { |int| INTEGER_TO_WORD[int] }
end

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

puts alphabetic_number_sort((0..2).to_a) == [1, 2, 0]
puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
