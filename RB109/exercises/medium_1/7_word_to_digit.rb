require 'pry'

=begin
Word to Digit

Write a method that takes a sentence string as input, and returns 
the same string with any sequence of the words 'zero', 'one', 
'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' 
converted to a string of digits.

Example:

word_to_digit('Please call me at five five five one two three four. Thanks.') ==
  'Please call me at 5 5 5 1 2 3 4. Thanks.'

- Understand the problem
  - Input
    - String
  - Output
    - New String with number words converted to string digits
  - Rules

- Examples
  - Covered

- Algorithm
  Method: #word_to_digit, args: `input_sentence`
    - assign Hash with number word as key and its string digit representation as
      values to constant NUMBER_WORDS
    - split input string `input_sentence` to Array of strings and assign to `words` 
    - assign empty Array to `input_words`
    - iterate over `input_words` as `word`
      - call #get_string_digit with `word` and assign to `string_digit`
      - if `string_digit` is not nil
        - add `string digit` to `final_words`
      - else
        - add `word` to `words_array`
    - join `final_words` into String separated by spaces and assign to `final_sentence`
    - return `final_sentence`

  Method: #get_string_digit, args: `word`
    - iterate over NUMBER_WORDS keys as `number_word`
      - if `word` contains `number_word`
        - assign NUMBER_WORDS value at key current `word` to `string_digit`
        - replace `number_word` with `string_digit` in `word` and assign to `final_word`
        - return `final_word`
      - else
        - return `word`

- Code
=end

NUMBER_WORDS = {
  'zero'=> '0',
  'one'=> '1', 
  'two'=> '2',
  'three'=> '3',
  'four'=> '4',
  'five'=> '5',
  'six'=> '6',
  'seven'=> '7',
  'eight'=> '8',
  'nine'=> '9',
}

# def get_string_digit(word)
#   NUMBER_WORDS.each do |number_word, string_digit|
#     return word.gsub(number_word, string_digit) if word.include?(number_word)
#   end

#   nil
# end

# def word_to_digit(input_sentence)
#   input_words = input_sentence.split
#   final_words = []

#   input_words.each do |word|
#     string_digit = get_string_digit(word)
    
#     if string_digit.nil?
#       final_words << word
#     else
#       final_words << string_digit
#     end
#   end

#   final_sentence = final_words.join(" ")
  
#   final_sentence
# end

def find_digit(word)
  NUMBER_WORDS.each do |number_word, string_digit|
    return word.gsub(number_word, string_digit) if word.include?(number_word)
  end

  nil
end

def word_to_digit(sentence)
  sentence
    .split
    .map { |word| find_digit(word) || word }
    .join(" ")
end

input  = 'Please call me at five five five one two three four. Thanks.'
result = 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts word_to_digit(input) == result
