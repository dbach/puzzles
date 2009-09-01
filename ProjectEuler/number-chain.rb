#!/usr/bin/env ruby
#
#  Copyright (c) 2006 . All rights reserved.
#
# calculate a number chain

max_value = ARGV[0].to_i

require 'rubygems'
require 'inline'

class NumberChain

  def compute_next(i)
    return i.to_s.split('').inject(0) { |sum,d| sum += d.to_i**2 }
  end

  def compute_next2(i)
    n = 0
    while (i > 0)
      n += (i % 10)**2
      i = i / 10
    end
    return n
  end

  inline do |bld|
    bld.c "int compute_next_c(int i) {
      int n;
      for (n = 0; i > 0; i = i / 10) { n += (i % 10) * (i % 10); }
      return n;
    }"
  end
  
end

nc = NumberChain.new

results = Array.new
results[1] = 1
results[89] = 89

(2..max_value).each do |i|
  next_i = i
  
  chain = [ i ]
  while results[next_i].nil? 
    next_i = nc.compute_next_c(next_i)
    chain.push(next_i)
  end
#  if next_i != chain.last
#    puts "ERROR: weird! expected #{next_i} as last element in chain for #{i}"
#  end
#  if results[chain.last] != 1 && results[chain.last] != 89
#    puts "ERROR: chain #{i} -> #{chain.last} -> #{results[chain.last]}"
#  end
  
  chain.each { |j| 
    if results[j].nil?
      results[j] = results[next_i]      
    elsif results[j] != results[next_i]
      puts "ERROR: previous chain #{j} -> #{results[j]}, but #{i} -> #{j} -> #{results[next_i]}"
    end
  }
  
end

eighty_nines = results.find_all { |i| i == 89 }
puts eighty_nines.size
