#!/usr/bin/env python
# encoding: utf-8
"""
018-number-triangle-2.py

Created by Dave on 2009-08-09.
Copyright (c) 2009 Squizion Software. All rights reserved.
"""

import sys
import getopt
import copy

help_message = '''
usage: number-triangle.py [-f file] [-t]

Calculate the sum along the maximum path through the triangle
'''

example = []
example += [[ 3 ]]
example += [[ 7, 4 ]]
example += [[ 2, 4, 6 ]]
example += [[ 8, 5, 9, 3 ]]

# at row 0, the bset sum through the triangle is row[0]

# at row 1, the best sum through the triangle is:
# max(the values in row 1) + row[0] -> row[0]

# at row N, the best sum through the triangle is:
# for i in 0 to len(row[N-1]): 
#   

def best_path(triangle, best_sum, row):
	if row is 0: 
		return best_sum[0][0]
	l = len(triangle[row])
	for i in range(0, l-1):
		best_sum[row-1][i] += max(triangle[row][i], triangle[row][i+1])
	return best_path(triangle, best_sum, row-1)

def read_triangle(file):
	triangle = []
	f = open(file, 'r')
	for l in f:
		ary = l.strip().split(' ')
		row = [int(x) for x in ary]
		triangle += [ row ]
	return triangle

def print_triangle(t):
	for r in t:
		print r

class Usage(Exception):
	def __init__(self, msg):
		self.msg = msg


def main(argv=None):
	if argv is None:
		argv = sys.argv
	try:
		try:
			opts, args = getopt.getopt(argv[1:], "hf:tv", ["help", "file="])
		except getopt.error, msg:
			raise Usage(msg)
	
		# option processing
		for option, value in opts:
			if option == "-v":
				verbose = True
			if option in ("-h", "--help"):
				raise Usage(help_message)
			if option in ("-f", "--input"):
				triangle = read_triangle(value)
			if option in ("-t"):
				triangle = example
		
		if verbose:
			print_triangle(triangle)
		best_sum = copy.copy(triangle)
		sum = best_path(triangle, best_sum, len(triangle)-1)
		if verbose:
			print_triangle(best_sum)
		print "Maximum sum:", sum
		
	except Usage, err:
		print >> sys.stderr, sys.argv[0].split("/")[-1] + ": " + str(err.msg)
		print >> sys.stderr, "\t for help use --help"
		return 2


if __name__ == "__main__":
	sys.exit(main())
