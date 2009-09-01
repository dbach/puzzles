#!/usr/bin/env python

# 

n = 585

def int2bin(n, count=24):
	"""returns the binary of integer n, using count number of digits"""
	return "".join([str((n >> y) & 1) for y in range(count-1, -1, -1)])

def isBase10Pal(n):
	"""return whether n is a palindrome in base 10"""
	return isPalindrome(str(n))
	
def isBase2Pal(n):
	"""return whether n is a palindrome in base 2"""
	
	return True

def isPalindrome(s):
	"""return whether a string is a palindrome"""
	return s == s[::-1]
