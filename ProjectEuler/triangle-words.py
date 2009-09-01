#!/usr/bin/env python
# encoding: utf-8
"""
triangle-words.py

Created by David Bacher on 2008-12-31.
Copyright (c) 2008 Squizion Software. All rights reserved.
"""

import sys
import getopt


help_message = '''
The help message goes here.
'''

def isTriangle(num):
	triangle_values = [1, 3, 6, 10, 15, 21, 28]
	if num in triangle_values:
		return True
	else:
		for i in range(25):
			t_value = i * (i+1) / 2
			if num is t_value:
				return True
	return False
	
def checkWord(word):
	ord_array = [ord(c) - ord('A') + 1 for c in word]
	# debug
	#print word + ' -> ' + str(ord_array)
	return isTriangle(sum(ord_array))

class Usage(Exception):
	def __init__(self, msg):
		self.msg = msg


def main(argv=None):
	if argv is None:
		argv = sys.argv
	try:
		try:
			opts, args = getopt.getopt(argv[1:], "hi:o:v", ["help", "input=", "output="])
		except getopt.error, msg:
			raise Usage(msg)
	
		verbose = False
		input_file = None
		output = None
		
		# option processing
		for option, value in opts:
			if option == "-v":
				verbose = True
			if option in ("-h", "--help"):
				raise Usage(help_message)
			if option in ("-i", "--input"):
				input_file = value
			if option in ("-o", "--output"):
				output = value
		
		if input_file:
			word_file = open(input_file)
			for word_line in word_file.readlines():
				words = word_line.split(',')
				for v in words:
					word = v.strip('"')
					#debug
					#print 'checking: ' + word
					if checkWord(word):
						print word
		else:
			for arg in argv[1:]:
				if checkWord(arg):
					print arg
		
	except Usage, err:
		print >> sys.stderr, sys.argv[0].split("/")[-1] + ": " + str(err.msg)
		print >> sys.stderr, "\t for help use --help"
		return 2


if __name__ == "__main__":
	sys.exit(main())
