=begin
Identify Yourself (Part 1)

Using the following code, add a method named #identify that returns its calling 
object.
=end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

=begin
Discussion

In the last two exercises, we used self to define class methods and to modify 
instance variables. self is used because it refers to the calling object. This 
means that, in our solution, invoking self is the same as invoking kitty.

p kitty.identify # => #<Cat:0x007f932b06dba8 @name="Sophie">
p kitty          # => #<Cat:0x007f932b06dba8 @name="Sophie">

We use #p to print the object so that #inspect is called, which lets us view 
the instance variables and their values along with the object.
=end
