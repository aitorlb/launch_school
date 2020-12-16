=begin
Reverse Engineering

Write a class that will display:
=end

class Transform
  def self.lowercase(string)
    string.downcase
  end

  def initialize(string)
    @string = string
  end

  def uppercase
    @string.upcase
  end
end

my_data = Transform.new('abc') 
puts my_data.uppercase # => ABC
puts Transform.lowercase('XYZ') # => xyz
