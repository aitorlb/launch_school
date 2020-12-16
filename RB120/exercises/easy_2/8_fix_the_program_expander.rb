=begin
Fix The Program - Expander

What is wrong with the following code? What fix(es) would you make?
=end

class Expander
  def initialize(string)
    @string = string
  end

  # As of Ruby 2.7, it is now legal to call private methods with a literal self 
  # as the caller.
  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
