=begin
Delete vowels

Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels (a, e, i, o, u) removed.

Example:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Understand the problem
- input: Array<String>
- output: Array<String>
- rules:
  - return array of strings with the vowels removed.
  - ignore case (judging from given examples)

Test cases
- well covered by examples

Describe Agorithm
- assign vowels to constant
- collect/map over strings in array
  - split string into chars
  - select char if is not vowel (downcase first), else return nil
  - join chars

Begin coding
=end

VOWELS = %w(a e i o u)

def remove_vowels(strings)
  strings.map do |string|
    string.chars.select { |char| !vowel?(char) }.join
  end
end

def vowel?(char)
  VOWELS.include?(char.downcase)
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))# == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white))# == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ))# == ['BC', '', 'XYZ']
