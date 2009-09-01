#!/usr/bin/env python

import operator      

def fact(x): 
	return reduce(operator.mul, xrange(2, x+1))
