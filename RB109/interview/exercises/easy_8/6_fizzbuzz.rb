=begin
fizzbuzz

Write a method that takes two arguments: the first is the starting number, and
the second is the ending number. Print out all numbers between the two numbers,
except if a number is divisible by 3, print "Fizz", if a number is divisible by
5, print "Buzz", and finally if a number is divisible by 3 and 5, print
"FizzBuzz".

Example:

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

- Understand the problem
  - Input
    - Two Integer numbers: a starting number and an ending number
  - Output
    - Print out all numbers between the two numbers, except:
      - if a number is divisible by 3, print "Fizz",
      - if a number is divisible by 5, print "Buzz"
      - if a number is divisible by 3 and 5, print "FizzBuzz".
  - Rules
    - Assume first number is lower than second number

- Examples
  - Covered

- Algorithm
  fizzbuzz
    1. Iterate from `starting_number` to `ending_number`
      - if current `number` is divisible by 3 and 5 
        - print "FizzBuzz"
      - else if current `number` is divisible by 3
        - print "Fizz"
      - else if current `number` is divisible by 5
        - print "Buzz"
      - else
        - Print `number`

  divisible_by?
    - Compare remainder of division between dividend and divisor to zero

- Code
=end

def divisible_by?(dividend, divisor)
  dividend % divisor == 0
end

def fizzbuzz(starting_number, ending_number)
  (starting_number..ending_number).each do |number|
    if divisible_by?(number, 3) && divisible_by?(number, 5)
      puts "FizzBuzz"
    elsif divisible_by?(number, 3)
      puts "Fizz"
    elsif divisible_by?(number, 5)
      puts "Buzz"
    else
      puts number
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
