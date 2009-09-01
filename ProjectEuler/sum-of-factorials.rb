#!/usr/bin/ruby

# Find curious numbers such that the sum of the factorial of each digit
# is equal to the number:
# e.g. 145 = 1! + 4! + 5! = 1 + 24 + 120

fact_values = [0]
prev = 1
(1..9).each { |i| 
  prev = i * prev
  fact_values.push(prev) 
}

marker = 10

(3..10000000).each { |i|
  if (i == marker)
    print "Testing: #{marker}\n"
    marker *= 10
  end

  digit_list = []
  i.to_s.each_byte { |d| digit_list.push(d.to_i - 48) }
  
  result = digit_list.inject(0) { |total,d| 
    total += fact_values[d] 
    #print "DEBUG: #{total}, #{d}, #{fact_values[d]}"
  }
  
  if (i == result)
    print "#{result} = " + digit_list.collect { |d| d.to_s + "!" }.join(' + ') + "\n"
  end 
}
