#!/usr/bin/ruby
#
# three-letter-xor

# Each character on a computer is assigned a unique code and the preferred standard 
# is ASCII (American Standard Code for Information Interchange). For example, 
# uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
# 
# A modern encryption method is to take a text file, convert the bytes to ASCII, 
# then XOR each byte with a given value, taken from a secret key. The advantage 
# with the XOR function is that using the same encryption key on the cipher text, 
# restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
# 
# For unbreakable encryption, the key is the same length as the plain text message, 
# and the key is made up of random bytes. The user would keep the encrypted message 
# and the encryption key in different locations, and without both "halves", it is 
# impossible to decrypt the message.
# 
# Unfortunately, this method is impractical for most users, so the modified method 
# is to use a password as a key. If the password is shorter than the message, which 
# is likely, the key is repeated cyclically throughout the message. The balance for
# this method is using a sufficiently long password key for security, but short enough 
# to be memorable.
# 
# Your task has been made easy, as the encryption key consists of three lower case 
# characters. Using cipher1.txt (right click and 'Save Link/Target As...'), a file 
# containing the encrypted ASCII codes, and the knowledge that the plain text must 
# contain common English words, decrypt the message and find the sum of the ASCII 
# values in the original text.


common_words = %w{ the this that and are }

input='cipher1.txt'

secret_text = Array.new

f = File.new(input)
f.each_line do |l|  
  l.chomp!
  secret_text.concat( l.split(',').map { |s| s.to_i } )
end


def decrypt(a, key)
  d = Array.new
  a.each_with_index { |c,idx| d.push(c ^ key[idx % key.length].to_i) }
  return d
end

def smash(a)
  a.inject("") { |s,i| s += i.chr }
end

solution = decrypt(secret_text, "god")
p solution.inject(0) { |sum,i| sum += i }

# ('a'..'z').each do |k0|
#   ('a'..'z').each do |k1|
#     ('a'..'z').each do |k2|
#       key = k0 + k1 + k2
#       cleartext = smash(decrypt(secret_text, key))
#       # count the number of common words in the clear text      
#       sum = common_words.inject(0) { |sum,w| sum += cleartext.scan(w).length }
#       
#       if sum > 5 then
#         p "Possible Solution for #{key}:"
#         p cleartext
#       end
#     end
#   end
# end

