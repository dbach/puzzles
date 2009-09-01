#!/usr/bin/python

def is_valid(n):
    r = '1234567890'
    str_n = str(n)
    for i,c in enumerate(r):
    	#print "[%d]: %c == %c" % (i, c, str_n[2*i])
    	if str_n[2*i] is not c:
	        return False
	return True

for n in range(1000000030, 1400000030, 100):
	if is_valid(n**2):
		print n
		exit

for n in range(1000000070, 1400000070, 100):
	if is_valid(n**2):
		print n
		exit
