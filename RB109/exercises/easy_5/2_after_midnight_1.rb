require 'pry'

=begin
After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after
midnight. If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the
time of day in 24 hour format (hh:mm). Your method should work with any integer
input.

You may not use ruby's Date and Time classes.

Examples:

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Disregard Daylight Savings and Standard Time and other complications.

1. Understand problem
  - input
    - integer (postive, negative or zero)
  - output
    - string (representation of time)
  - rules
    - return the time of day in 24 hour format (hh:mm)
    - You may not use ruby's Date and Time classes.
    - Disregard Daylight Savings and Standard Time and other complications.

2. Test cases
 - well covered by examples

3. Describe algorithm
  - calculate total minutes in a day
  - divide minutes argument by total minutes in day and get remainder (modulo)
  - if minutes is negative
    - rest minutes to total_minutes
  - get hours and minutes separately
    - divide remainder by 60 minutes to get hours
    - and save remainder as minutes
  - cast hours & minutes to string
  - handle single digits in hours & minutes
    - if character count is 1
      - prepend "0"
  - return hours and minutes in required format

4. Begin coding
=end

def time_of_day(time_in_minutes)
  minutes_in_day = 24 * 60
  rest_of_minutes = time_in_minutes.abs % minutes_in_day
  rest_of_minutes = minutes_in_day - rest_of_minutes if time_in_minutes.negative?

  hours, minutes = rest_of_minutes.divmod(60)
  hours_str, minutes_str = [hours, minutes].map(&:to_s)
  [hours_str, minutes_str].each { |str| str.prepend("0") if str.size == 1 }

  hours_str + ":" + minutes_str
end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

=begin
Further Exploration

How would you approach this problem if you were allowed to use ruby's Date and
Time classes? Suppose you also needed to consider the day of week? (Assume that
delta_minutes is the number of minutes before or after midnight between Saturday
and Sunday; in such a method, a delta_minutes value of -4231 would need to
produce a return value of Thursday 01:29.)
=end
