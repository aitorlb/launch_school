require 'pry'

=begin
After Midnight (Part 2)

As seen in the previous exercise, the time of day can be represented as the
number of minutes before or after midnight. If the number of minutes is
positive, the time is after midnight. If the number of minutes is negative,
the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return
the number of minutes before and after midnight, respectively. Both methods
should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though;
it makes the problem more interesting.

Disregard Daylight Savings and Standard Time and other irregularities.

Understand the problem
  - input
    - string => time of day in 24 hour format i.e. '00:00'
  - output
    - integer => in the range 0..1439.
  - rules
    - You may not use ruby's Date and Time methods.
    - after_midnight => minutes after midnight, from 0 to time
    - before_midnight => minutes before midnight, from time to 1440

Test cases
  - Well covered by examples

Describe algorithm
  - convert incoming string to minutes
    - split string into hours and minutes
    - convert hours and minutes to integer
    - multipy hours by 60
    - sum minutes
  - after_midnight
    - convert incoming string to minutes
    - return minutes
  - before_midnight
    - convert incoming string to minutes
    - substract minutes to 1440
    - return minutes

Begin coding
=end

# MINUTES_IN_DAY = 1440

# def after_midnight(time_string)
#   time_in_minutes(time_string)
# end

# def before_midnight(time_string)
#   minutes = time_in_minutes(time_string)
#   minutes.zero? ? 0 : MINUTES_IN_DAY - minutes
# end

# def time_in_minutes(time_string)
#   hours, minutes = time_string.split(":").map(&:to_i)
#   minutes += hours * 60
#   minutes == MINUTES_IN_DAY ? 0 : minutes
# end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
