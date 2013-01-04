# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import gauss

def setup():		
	p.size(800,200)
	p.background(255)
	p.smooth()

def draw():
	
	sd = 60	# standard deviation			
	mean = width/2 # mean 
	xloc = gauss(mean, sd) # gets gaussian random number
	
	p.noStroke()
	p.fill(0,10)
	p.ellipse(xloc, height/2, 16,16) # draw ellipse at our random location

p.run()
