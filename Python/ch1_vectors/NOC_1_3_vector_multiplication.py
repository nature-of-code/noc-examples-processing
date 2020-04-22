# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

# Example 1-4: Vector multiplication
# Note: although using p.PVector is possible, here numpy arrays are substituted

import pyprocessing as p
from numpy import array

def setup():
	p.size(800,200)
	p.smooth()
	
def draw():
	p.background(255)
	
	mouse = array([p.mouse.x, p.mouse.y]) 
	center = array([width/2, height/2]) 
	mouse -= center
	mouse *= 0.5

	p.translate(width/2, height/2)
	p.strokeWeight(2)
	p.stroke(0)
	p.line(0, 0, mouse[0], mouse[1])

p.run()
