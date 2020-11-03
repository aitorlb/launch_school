=begin
Madlibs

Mad libs are a simple game where you create a story template with blanks for
words. You, or another player, then construct a list of words and place them
into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and
an adjective and injects those into a story that you create.

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

- Understand the problem
  - Input
    - a noun, a verb, an adverb, and an adjective
  - Output
    - A String which contains the list of words in a simple story.
  - Rules
    - do not handle empty inputs

- Examples
  - Covered

- Algorithm
  Method: `enter_word_prompt`
    1. Assign empty String to `user_input`
    2. loop
      - Promt "Enter #{word_prompt}: "
      - Get string from user
      - if `user_input` is not blank
        - break
      - else
        - do nothing
    3. Return `user_input`

  Method: `madlibs`
    1. call `enter_word_prompt` with "a noun" and assign return value to `noun`
    2. call `enter_word_prompt` with "a verb" and assign return value to `verb`
    3. call `enter_word_prompt` with "an adjective" and assign return value to `adjective`
    4. call `enter_word_prompt` with "an adverb" and assign return value to `adverb`
    5. Return "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

- Code
=end

def enter_word_prompt(word_prompt)
  loop do
    print "Enter #{word_prompt}: "
    user_input = gets.strip.chomp
    break user_input unless user_input.empty?
  end
end

def madlibs
  noun      = enter_word_prompt("a noun")
  verb      = enter_word_prompt("a verb")
  adjective = enter_word_prompt("an adjective")
  adverb    = enter_word_prompt("an adverb")

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

madlibs
