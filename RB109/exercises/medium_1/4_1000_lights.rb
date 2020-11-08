require 'pry'

=begin
1000 Lights

You have a bank of switches before you, numbered from 1 to n. Each switch is 
connected to exactly one light that is initially off. You walk down the row of 
switches and toggle every one of them. You go back to the beginning, and on 
this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, 
you go back again to the beginning and toggle switches 3, 6, 9, and so on. You 
repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and 
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is 
[1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is 
[1, 4, 9].

light_switches(10) == [1, 4]
light_switches(10) == [1, 4, 9]

- Understand the problem
  - Input
    - Integer number (positive)
      - the total number of switches
  - Output
    - Array of Integer numbers
      - Array that identifies which lights are on after n repetitions
  - Rules
    - Switches are numbered from 1 to n
    - round 1: all lights are on
    - round 2: lights 2, 4, 6, etc. are now off 
    - round 3: lights 3, 6, 9, etc. are now off 

- Examples
  - Covered

- Algorithm
  - assign Array from 1 to n to `all_lights`
  - assign empty Array to `final_lights`
  - loop over `all_lights`
    - if current `index` is 1
      - assign `all_lights` to `final_lights`
    - else
      - slice `all_lights` from (`index` - 1) to end and assign to `lights`
      - iterate over `lights` 
        - if current `light` is divisible by `index`
          - if `light` is not in `final_lights`
            - add it
          - else
            - pop it
        - else
          - do nothing
    - return `final_lights`

- Code
=end

def light_switches(n)
  all_lights = (1..n).to_a
  final_lights = []

  all_lights.each do |index|
    next final_lights = all_lights if index == 1

    lights = all_lights[(index - 1)..]

    lights.each do |light|
      next unless light % index == 0

      if final_lights.include?(light)
        final_lights -= [light]
      else
        final_lights += [light]
      end
    end
  end

  final_lights.sort
end

puts light_switches(5) == [1, 4]
puts light_switches(10) == [1, 4, 9]
