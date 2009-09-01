#!/sw/bin/ruby -w
#
# special sum set problems

# n=7 : 20, 31, 38, 39, 40, 42, 45

def verify_no_sum(sums, val)
  unless sums[val].nil? 
    puts "ERROR: sum #{val} already exists"
    return false
  end
  sums[val] = true
  return true
end

def generate_subset(set, state)
  result = Array.new
  (0..set.size-1).each { |i| result.push(set[i]) if state & (2**i) > 0 }
  return result
end

# LATER: still need to check if B.size > C.size => S(B) > S(C)

def check_special_sum(set)

  sums = Array.new
  # initialize the sums array with the set elements
  #set.each { |i| verify_no_sums(sums, i) }
  
  max = 2**set.size-1
  (1..max).each do |i|
    subset = generate_subset(set, i) 
    puts "subset: " + subset.join(' ')
    sum = subset.inject(0) { |sum,j| sum += j }
    unless verify_no_sum(sums, sum)
      return false
    end
  end
  return true
end

