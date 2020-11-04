require 'pry'

=begin
Grocery List

Write a method which takes a grocery list (array) of fruits with quantities and 
converts it into an array of the correct number of each fruit.

Example:

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

- Understand the problem
  - Input
    - Array of Array elements
      - Array element contains a String and an Integer
        - String represent a fruit
        - Integer represent desired quantity of given fruit
  - Output
    - Array of String elements
      - Arrau should contain the correct number of each fruit
  - Rules

- Examples
  - Covered

- Algorithm
  - assign empty Array to `fruits`
  - Iterate over input `fruits_wih_quantity`
    - Loop `quantity` times
      - Add `fruit` to `fruits`
  - Return `fruits`

- Code
=end

def buy_fruit(fruits_wih_quantity)
  fruits = []
  
  fruits_wih_quantity.each do |fruit, quantity|
    quantity.times do
      fruits << fruit
    end
  end

  fruits
end

def buy_fruit(fruits_wih_quantity)
  fruits_wih_quantity
    .each_with_object([]) do |(fruit, quantity), array|
      array << Array.new(quantity, fruit)
      array.flatten!
    end
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
