=begin
Bannerizer
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

You may assume that the input will always fit in your terminal window.

Understand problem
  - input: sring
    - short sentence
  - output: sring
    - short sentence within a box

Test cases
- well covered by examples.

Describe algorithm
  - assign sentence size to variable
  - print top of box
    - multiply middle "-" by sentence length
  - print top middle box
    - multiply middle " " by sentence length  
  - print middle box
    - print sentence in middle
  - print bottom middle box
    - multiply middle " " by sentence length  
  - print bottom of box
    - multiply middle "-" by sentence length

Begin problem
=end

def print_in_box(sentenze)
  puts "+-#{'-' * sentenze.size}-+"
  puts "| #{' ' *sentenze.size} |"
  puts "| #{sentenze} |"
  puts "| #{' ' *sentenze.size} |"
  puts "+-#{'-' * sentenze.size}-+"
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

=begin
Further Exploration

For a real challenge, try word wrapping very long messages so they appear
on multiple lines, but still within a box (80 columns, including the sides of
the box).
=end
