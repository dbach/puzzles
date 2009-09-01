#!/sw/bin/ruby
# problem 21
# Find the sum of all amicable pairs under 10000
# e.g. 220 => 1, 2, 

def divisors(n)
  return (1..n/2).select { |i| (n % i) == 0 }
end

sum = 0
amicable_table = Array.new

(2..10000).each { |n|
  if (amicable_table[n].nil?)
    s1 = divisors(n).inject(0) { |total,i| total += i }
    amicable_table[n] = s1
    
    if (amicable_table[s1].nil?)
      s2 = divisors(s1).inject(0) { |total,i| total += i }
      amicable_table[s1] = s2
    else
      s2 = amicable_table[s1]
    end
    
    if (s2 == n && s1 != n) 
      print "amicable numbers: #{n}, #{s1}\n"
      sum += n + s1
    end
  end
}

print "Sum: #{sum}\n"
