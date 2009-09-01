#!/usr/bin/env ruby
#
#  Copyright (c) 2006 Squizion Software. All rights reserved.
#
# calculate number of distinct terms in a ** b for  2 <= a <= 100, 2 <= b <= 100

# Represent a number by its prime factorization
# a      = p1 * p2 * p3
# a ** 2 = (p1 * p1) * (p2 * p2)..

# Create the sequence, eliminating numbers with same factorization

$primes = [ 2, 3, 5, 7 ]

def build_table(i)
  flag = true
  $primes.each do |j| 
    flag = false if (i % j) == 0
  end
  $primes.push(i) if flag
end

(2..100).each { |i| build_table(i) }


class PFNum
  attr_reader :factors
  def initialize(num)
    @factors = factorize(num)
  end
  
  def factorize(num)
    # FIXME: improve this to count multiple factors of the same number
    facts = []
    ufs = $primes.find_all { |i| (num % i) == 0 }

    t = num
    ufs.each do |i|
      while (t > 1 && (t % i) == 0)
        facts.push(i)
        t = t / i
      end
    end
    #puts "#{num} => #{facts.join(',')}"
    return facts
  end
  
  def ==(j)
    if j.kind_of?(PFNum)
      @factors == j.factors
    elsif j.kind_of?(Integer)
      @factors == factorize(j)
    end
  end
  
  def power(pow)
    @factors = @factors * pow
    @factors.sort!
  end
  
  def to_s
    return @factors.join(',')
  end
end

seq = []
(2..100).each do |b|
  puts "calculating powers of #{b}.."
  (2..100).each do |a|
    f = PFNum.new(a)
    f.power(b)
    #puts "#{a} ** #{b} => #{f.factors}"  # "#{f.factors.join(' ')}"
    seq.push(f) unless seq.include?(f)
  end
end

puts "sequence: length=#{seq.size}"  #" => #{seq.join(' ')}"

class PrimeFactorSequence
  
end
