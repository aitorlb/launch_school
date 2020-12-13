=begin
Method Lookup (Part 2)

Using the following code, determine the lookup path used when invoking cat1.
color. Only list the classes and modules that Ruby will check when searching 
for the #color method.
=end

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# Solution: [Cat, Animal, Object, Kernel, BasicObject]

# Since the method isn't anywhere, the answer includes every class and module 
# in the search path.

p Cat.ancestors # => [Cat, Animal, Object, Kernel, BasicObject]
