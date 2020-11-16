 require 'pry'

=begin
Matching Parentheses?

Write a method that takes a string as argument, and returns true if all 
parentheses in the string are properly balanced, false otherwise. To be 
properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).

- Understand the problem
  - Input
    - String
  - Output
    - true/false
  - Rules
    - Returns true if all parentheses in the string are properly balanced, 
      false otherwise.
    - Balanced parentheses must occur in matching '(' and ')' pairs.
    - Balanced parentheses must each start with a '(', not a ')'.
    - Returns true when string has no parentheses: balanced?('Hey!') == true
    - Accept nested parents "(()())"

- Test cases
  - Covered by examples

- Algorithm
  Method: `balanced?`, args: `string` => OUTDATED
    - assign [] to `parentheses`
    - split `string` into chars and assign to `characters`

    - iterate over `characters` as `char`
      - if `char` is eq to '(' or ')'
        - if `parentheses.last` is nil
          - push `char` to `parentheses`
        - else
          - if `parentheses.last` is eq to '(' and `char` is eq ')'
            or `parentheses.last`` is eq to ')' and `char` is eq '('
            - do nothing
          - else
            - return false
      - else
        - do nothing

    - if `parentheses.size` is even
      - return true
    - else
      - return false
      
- Code
=end

OPEN_PAREN  = "("
CLOSE_PAREN = ")"
PARENTHESES = [OPEN_PAREN, CLOSE_PAREN]
JOINED_PARENS = PARENTHESES.join

# def balanced?(string)
#   parentheses = []
#   characters = string.chars

#   characters.each do |char|
#     if PARENTHESES.include?(char)
#       if parentheses.size.even? && char.eql?(CLOSE_PAREN)
#         return false
#       elsif parentheses.size.odd? && char.eql?(OPEN_PAREN)
#         return false
#       else
#         parentheses.push(char)
#       end
#     end
#   end

#   parentheses.size.even?
# end

def balanced?(string)
  characters    = string.chars
  parentheses   = characters.select { |char| PARENTHESES.include?(char) }
  joined_parens = parentheses.join

  while !joined_parens.empty? && joined_parens.include?(JOINED_PARENS)
    joined_parens.sub!(JOINED_PARENS, "")
  end

  joined_parens.size.zero? 
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
