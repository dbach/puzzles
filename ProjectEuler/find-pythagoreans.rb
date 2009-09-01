#!/usr/bin/env ruby
#
#  Copyright (c) 2006 . All rights reserved.
#
# Project Euler: problem 75
# Given that L is the length of the wire, for how many values of L ≤ 1,000,000 
# are there exactly one right angle triangle that can be formed?

max_value=ARGV[0].to_i
max_value ||= 500

#ideas
# use hash instead of array
# use forward and reverse hashes to precompute squares
# 
# for all even P, all a, b = P * (P-2*a)/2(P-a) while a < b
# increment P counter iff b == b.to_i

def alg4(max_value)
  perimeters = Hash.new 0
  (6..max_value/2).each do |p_sub|
    p = p_sub * 2
    (p_sub-1..3).each do |a|
      b = p * (p - 2*a) / (2.0 * (p-a))
      # avoid double counting
      break if b > a

      if b > 0 && b == b.to_i
        #puts "debug: adding perimeter #{p} = #{a} + #{b} + ..."
        perimeters[p] += 1
      end
    end
  end
  return perimeters
end

def check_pythagoran(a, b)
  c = Math.sqrt(a**2 + b**2)
  return (a+b+c) if c == c.to_i
  return 0
end

def alg1(max_value)
  perimeters = Hash.new(0)
  (3..max_value).each do |a| 
    puts "#{a}" if a % 1000 == 0
    (3..a-1).each do |b|
      
      p = check_pythagoran a, b
      if p > 0
        perimeters[p] += 1
      end
    
    end
  end
  return perimeters
end

def alg2(max_value)
  perimeters = Hash.new(0)
  squares = [ 1, 4, 9, 16 ]
  
  (3..max_value).each do |c|
    c_sq = c**2
    while squares.last < c_sq do
      #puts "debug: adding #{squares.size} = #{squares.size**2}"
      squares.push(squares.size**2) 
    end
    
    squares.each_index do |b|
      b_sq = squares[b]
      puts "ERROR #{b+1}**2 != #{b_sq}" if b_sq != (b+1)**2
      
      if squares.include?(c_sq - b_sq)
        a = Math.sqrt(c_sq - b_sq)
        p = a + (b+1) + c
        puts "debug: adding perimeter #{p}"
        perimeters[p] += 1
      end
    end
  end
  return perimeters
end

class Squares
  def initialize (max_value)
    @ary = (3..max_value).collect { |i| i**2 }
  end
  
  def include? (value)
    @ary.each { |i|
      return true if i == value
      break if i > value
    }
    return false
  end
  
  def [] (index)
    return @ary[index]
  end
end

def alg3(max_value)
  sq = Squares.new max_value
  perimeters = Hash.new 0
  puts "initialized"
  (3..max_value).each { |a|
    a_sq = sq[a-3]
    # ASSERT(a_sq == a**2)
    
    (3..a-1).each { |b|
      b_sq = sq[b-3]
      # ASSERT(b_sq == b**2)
      
      if sq.include?(a_sq+b_sq)
        c = Math.sqrt(a_sq + b_sq)
        p = a + b + c
        #puts "debug: adding perimeter #{p} = #{a} + #{b} + #{c}"
        perimeters[p] += 1
      end
    }
  }
  return perimeters
end

puts "checking side/perimeter lengths up to #{max_value}"
perimeters = alg4(max_value)

#perimeters.each { |k,v| puts "perimeter [#{k}]=#{v}"}

pscan = perimeters.select { |k,v| v == 1 }
#pscan.each { |p| puts "#{p}" }
puts "total: #{pscan.size}"
