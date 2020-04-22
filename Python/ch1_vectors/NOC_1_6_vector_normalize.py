# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

# Example 1-6: Demonstration of normalizing a vector (sets its length to 1)
# Note: although using p.PVector is possible, here numpy arrays are substituted

import pyprocessing as p
import numpy as np

def setup():
	p.size(400,400)
	p.smooth()
	
def draw():
	p.background(255)
	
	# vector that points to the mouse location
	mouse = np.array([p.mouse.x, p.mouse.y], dtype=float) 
	# vector that points to the center of the window
	center = np.array([width/2, height/2]) 
	# subtract center from mouse, gives vector pointing from center to mouse
	mouse -= center

	# normalize the vector
	mouse /= np.linalg.norm(mouse)
	# multiply length
	mouse *= 150

	# draw the resulting vector
	p.translate(width/2, height/2)
	p.strokeWeight(2)
	p.stroke(0)
	p.line(0, 0, mouse[0], mouse[1])

p.run()
