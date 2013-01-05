# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

# Example 1-2: Bouncing Ball, with PVector!

import pyprocessing as p

def setup():
	p.size(800,200)
	p.smooth()
	p.background(255)

	global location, velocity
	location = p.PVector(100,100)
	velocity = p.PVector(2.5,5)

	
def draw():
	p.noStroke()
	p.fill(255,10)
	p.rect(0,0,width,height)
	
	# add current speed to location
	location.add(velocity)
	
	if location.x > width or location.x < 0:
		velocity.x *= -1
	if location.y > height or location.y < 0:
		velocity.y *= -1
	
	# display circle at location	
	p.stroke(0)
	p.fill(175)
	p.ellipse(location.x, location.y, 16, 16)

p.run()
