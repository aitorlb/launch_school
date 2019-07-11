# How Many?
# Write a method that counts the number of occurrences of each element in a given array.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted,
# print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# Solution
def count_occurrences(array)
  array.uniq.each_with_object({}) { |e, hsh| hsh[e] = array.count(e) }
end

vehicles = %w[car car truck car SUV truck motorcycle motorcycle car truck]

assert_equal(
  { "car" => 4, "truck" => 3, "suv" => 1, "motorcycle" => 2 },
  count_occurrences(vehicles)
)

counted_occurrences = count_occurrences(vehicles)
counted_occurrences.each { |ary| puts ary.first + ' => ' + ary.last.to_s }

# LS Solution
def count_occurrences(array)
  occurrences = {}

  array.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

# Further Exploration

# Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

vehicles = %w[car Car truck car SUV truck motorcycle Motorcycle Car Truck]

# Solution
def count_occurrences(array)
  array = array.map(&:downcase)
  array.uniq.each_with_object({}) { |e, hsh| hsh[e] = array.count(e) }
end

assert_equal(
  { "car" => 4, "truck" => 3, "suv" => 1, "motorcycle" => 2 },
  count_occurrences(vehicles)
)
