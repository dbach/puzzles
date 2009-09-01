#!/usr/bin/env ruby
#
#  Copyright (c) 2006 . All rights reserved.
#
#  

# 1/x + 1/y = 1/n

# => x , y > n
# => x + y == xy/n
# => if x + y < xy/n, then x, y are out of range
# => one side of solution lies in the range n+1..2*n

max_value = ARGV[0].to_i if ARGV.size > 0
max_value ||= 1000
limit = ARGV[1].to_i if ARGV.size > 1
limit ||= 1000

def diophantine?(x, y, n)
  return x + y == xy/n
end

def solution(n)
  c = []
  (n+1..2*n).each { |x|
    y = (n*x).to_f / (x - n)
    c.push([x, y.to_i]) if y == y.to_i
  }
  return c
end

(5..max_value).each { |i| 
  s = solution(i) 
  puts "#{i} -> #{s.size}" if s.size > limit
  #puts s.join(' ')
}
