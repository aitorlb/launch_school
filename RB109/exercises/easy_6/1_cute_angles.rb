=begin

Cute angles

Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Note: your results may differ slightly depending on how you round values,
but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes
and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

Understand problem
  - input: Float
    - represents an angle between 0 and 360 degrees (!)
  - output: String
    - represents angle in degrees, minutes and seconds
  - rules
    - Use a ° to represent degrees, ' to represent minutes, and " to represent seconds.
    - A degree has 60 minutes, while a minute has 60 seconds.
  

Test cases
  - well covered by examples.

Describe algorithm
  - get number of decimals for rounding purposes
  - Get decimal part rounded and store it in variable `degrees_remainder`
  - multiply `remainder` by 60 to get minutes
  - get decimal part of `degrees_remainder` and store it in `minutes_remainder`
  - multiply `remainder` by 60 to get seconds
  - write helper method to represent result

Begin problem
=end

DEGREE = "\xC2\xB0"

def dms(angle)
  decimals_count    = decimals_count(angle)
  degrees_remainder = angle.modulo(1).round(decimals_count)
  minutes           = (degrees_remainder * 60).round(2)
  minutes_remainder = minutes.modulo(1)
  seconds           = (minutes_remainder * 60).round(2)

  represent_angle(angle.floor, minutes.floor, seconds.floor)
end

def decimals_count(number)
  decimals_count = number.integer? ? 0 : number.to_s.split(".").last.size
end

def represent_angle(angle, minutes, seconds)
  "#{angle}#{DEGREE}%02d'%02d\"" % [minutes, seconds]
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
