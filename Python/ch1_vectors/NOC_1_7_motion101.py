# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

# Example 1-7: Motion 101

import pyprocessing as p
from random import randint,uniform

def setup():
	p.size(400,400)
	p.smooth()
	global mover
	mover = Mover()
	
def draw():
	p.background(255)
	mover.update()
	mover.checkEdges()
	mover.display()
	
class Mover:
	
	def __init__(self):
		self.location = p.PVector(randint(0,width), randint(0,height))
		self.velocity = p.PVector(uniform(-2,2), uniform(-2,2))

	def update(self):
		self.location.add(self.velocity)
	
	def display(self):
		p.stroke(0)
		p.strokeWeight(2)
		p.fill(127)
		p.ellipse(self.location.x, self.location.y, 48, 48)	

	def checkEdges(self):
		
		if self.location.x > width:
			self.location.x = 0
		elif self.location.x < 0:
			self.location.x = width
			
		if self.location.y > height:
			self.location.y = 0
		elif self.location.y < 0:
			self.location.y = height

p.run()
