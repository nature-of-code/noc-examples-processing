# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

# Example 1-3: Vector subtraction
# Note: although using p.PVector is possible, here numpy arrays are substituted

import pyprocessing as p
import numpy as np

def setup():
	p.size(400,400)
	p.smooth()
	
def draw():
	p.background(255)
	
	mouse = np.array([p.mouse.x, p.mouse.y]) 
	center = np.array([width/2, height/2]) 
	mouse = mouse - center
	
	p.translate(width/2, height/2)
	p.strokeWeight(2)
	p.stroke(0)
	p.line(0, 0, mouse[0], mouse[1])

p.run()
