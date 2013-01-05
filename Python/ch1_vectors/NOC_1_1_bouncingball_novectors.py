# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p

x = 100
y = 100
xspeed = 1.
yspeed = 3.3

def setup():
	p.size(800,200)
	p.smooth()
	p.frameRate(60)
	
def draw():
	global x,y,xspeed,yspeed
	p.background(255)
	
	x += xspeed
	y += yspeed
	
	if x > width or x < 0:
		xspeed *= -1
	if y > height or y < 0:
		yspeed *= -1
		
	p.stroke(0)
	p.strokeWeight(2)
	p.fill(127)
	p.ellipse(x, y, 48, 48)

p.run()
