# Lecture: Classes and Objects

# As you know by now, classes are the blueprints for objects. Below are some 
# practice problems that test your knowledge of the connection between classes 
# and objects.

# 1. Given the below usage of the Person class, code the class definition.

# Code here
class Person
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end
# Code here

bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name                  # => 'Robert'

# 2. Modify the class definition from above to facilitate the following 
#    methods. Note that there is no name= setter method now.

# Code here
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    name_parts  = full_name.split
    @first_name = name_parts.first
    @last_name  = name_parts.last.to_s
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end
# Code here

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

# Hint: let first_name and last_name be "states" and create an instance method 
# called name that uses those states.

# 3. Now create a smart name= method that can take just a first name or a full 
#    name, and knows how to set the first_name and last_name appropriately.

# Code here
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    assign_name_parts(full_name)
  end

  def name=(full_name)
    assign_name_parts(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  private

  def assign_name_parts(full_name)
    name_parts      = full_name.split
    
    self.first_name = name_parts.first
    self.last_name  = name_parts.last.to_s
  end
end
# Code here

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
p bob.name                  # => 'John Adams'

# 4. Using the class definition from step #3, let's create a few more people -- 
#    that is, Person objects. If we're trying to determine whether the two 
#    objects contain the same name, how can we compare the two objects?

# Code here
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    assign_name_parts(full_name)
  end

  def name=(full_name)
    assign_name_parts(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def ==(other_person)
    self.name == other_person.name
  end

  private

  def assign_name_parts(full_name)
    name_parts      = full_name.split

    self.first_name = name_parts.first
    self.last_name  = name_parts.last.to_s
  end
end
# Code here

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob == rob # => true

# 5. Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" # => The person's name is: #<Person:0x0...>

# Let's add a to_s method to the class

# Code here
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    assign_name_parts(full_name)
  end

  def name=(full_name)
    assign_name_parts(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def ==(other_person)
    self.name == other_person.name
  end

  def to_s
    name
  end

  private

  def assign_name_parts(full_name)
    name_parts      = full_name.split

    self.first_name = name_parts.first
    self.last_name  = name_parts.last.to_s
  end
end
# Code here

# Now, what does the below output?
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" # => The person's name is: Robert Smith
