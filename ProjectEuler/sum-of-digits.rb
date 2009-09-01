#!/usr/bin/env ruby
#
#  Copyright (c) 2006 Squizion Software. All rights reserved.
#
#  

def sum_of_digits(i)
  a = i.to_s.split('').collect { |d| d.to_i }
  return a.inject(0) { |sum, d| sum += d ** 5 }
end

c = (2..400000).find_all { |v| v == sum_of_digits(v) }
puts c.inject(0) { |sum, s| sum += s }
