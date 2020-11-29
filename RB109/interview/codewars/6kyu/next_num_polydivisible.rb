=begin
Understand problem
  - input: number
    - positive integer
  - output: number/nil
    - return next bigger polydivisible number or nil
  - rules:
    - A number is polydivisible if:
      - its first digit is cleanly divisible by 1
      - its first two digits by 2
      - its first three by 3
      - and so on. 
    - There are finitely many polydivisible numbers.

Test cases
  - well covered by sample tests.

Describe algorithm
  - create method that determines if number is polydivisible
    - initialize array of digits
    - iterate over array with index (starting at 1)
      - grab first index count digits from array
      - if cleanly divisible by index (modulo)
        - keep iterating
      - else
        - return false
  - find next polydivisible
    - iterate from number + 1
      - if polydivisible
        - return current number
      - else
        - keep iterating
        
  - how to avoid infinite loop?
    - Dunno but: There are finitely many polydivisible numbers.

Begin coding
=end

def next_num(n)
  next_num = n + 1
  
  loop do
    break next_num if polydivisible?(next_num)
    next_num += 1
  end
end

def polydivisible?(n)
  digits = n.digits.reverse
  
  1.upto(digits.count) do |index|
    first_digits = digits.take(index).join.to_i
    return unless first_digits % index == 0
  end
  
  true
end

# puts(next_num(0)== 1)
# puts(next_num(10)== 12)
# puts(next_num(11)== 12)
# puts(next_num(1234)== 1236)
# puts(next_num(123220)== 123252)
puts(polydivisible?(12325)== true)
