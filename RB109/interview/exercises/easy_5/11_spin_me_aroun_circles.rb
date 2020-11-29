require 'pry'

=begin
Spin Me Around In Circles

You are given a method named spin_me that takes a string as an argument and
returns a string that contains the same words, but with each word's characters
reversed. Given the method's implementation, will the returned string be the
same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
=end

def spin_me(str)
  binding.pry
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

string = "hello world"
puts string.object_id
puts spin_me(string).object_id # "olleh dlrow"


=begin
No, because 
=end
