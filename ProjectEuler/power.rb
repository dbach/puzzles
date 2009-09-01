#!/usr/bin/ruby
#
# 

n = 10
n = ARGV[0].to_i if (ARGV.length > 0)

def my_power(n)
  p = 1
  n.times { p = (p * n) % 10000000000 }
  return p
end

result = (1..n).inject(0) { |sum,n| sum += my_power(n)  }
print result.to_s + "\n"