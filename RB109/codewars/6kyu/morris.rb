require 'pry'

=begin
def next_num(n)
  next_number = n + 1
  reverse_index = next_number.digits.length - 1 # 5
  number_length = next_number.digits.length # 6 
  while reverse_index != -1
    digits = next_number.digits.reverse 
    if (digits.slice(0..reverse_index).join.to_i) % number_length == 0
      reverse_index -= 1
      number_length -= 1
    else
      next_number += 1
    end
  end
  next_number
end

puts(next_num(0)== 1)
puts(next_num(10)== 12)
puts(next_num(11)== 12)
puts(next_num(1234)== 1236)
puts(next_num(123220)== 123252)

LAST TEST FAILS
=end

require 'pry'

def next_num(n)
  next_number = n + 1
  reverse_index = next_number.digits.length - 1
  number_length = next_number.digits.length

  
  while reverse_index != -1
    digits = next_number.digits.reverse
    first_n_digits = digits.slice(0..reverse_index + 1 ).join.to_i

    # binding.pry if next_number == 123250

    puts "first_n_digits: #{first_n_digits}"
    puts "number_length: #{number_length}"
    puts "#{first_n_digits} % #{number_length} == 0: #{first_n_digits % number_length == 0}"
    puts "-"

    if first_n_digits % number_length == 0
      reverse_index -= 1
      number_length -= 1

      puts "reverse_index: #{reverse_index}"
      puts "-"
    else
      next_number += 1

      puts "==========================="
      puts "next_number: #{next_number}"
      puts "-"
    end
  end
  
  next_number
end

puts(next_num(123220) == 123252)
