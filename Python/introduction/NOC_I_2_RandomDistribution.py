# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import randint

def setup():
	p.size(800,200);
	global randomCounts
	randomCounts = [0]*20

def draw():
	p.background(255)
	
	# pick a random number and increase the count
	index = randint(0,len(randomCounts)-1)
	randomCounts[index] += 1

	# draw a rectangle to graph results
	p.stroke(0);
	p.strokeWeight(2);
	p.fill(127);

	w = width/len(randomCounts)

	for x in range(0,len(randomCounts)):
		p.rect(x*w, height-randomCounts[x], w-1, randomCounts[x])

p.run()
