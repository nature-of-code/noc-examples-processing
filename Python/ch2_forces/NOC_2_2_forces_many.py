# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import randint,uniform

def setup():
	p.size(800,200)
	p.smooth()
	global movers
	movers = [Mover(uniform(0.1,4),0,0) for i in range(0,20)]
	
def draw():
	p.background(255)
	
	wind = p.PVector(0.01,0)
	gravity = p.PVector(0,0.1)

	for mover in movers:
		mover.applyForce(wind)
		mover.applyForce(gravity)

		mover.update()
		mover.checkEdges()
		mover.display()
	
class Mover:
	
	def __init__(self, mass, x, y):
		"""Creates new mover instance."""
		self.location = p.PVector(x, y)
		self.velocity = p.PVector(0, 0)
		self.acceleration = p.PVector(0, 0)
		self.mass = mass

	def applyForce(self,force):
		"""Adds force to acceleration vector."""
		f = p.PVector.div(force,self.mass)
		self.acceleration.add(f)

	def update(self):
		"""Updates velocity & location."""
		self.velocity.add(self.acceleration)
		self.location.add(self.velocity)
		self.acceleration.mult(0)
	
	def display(self):
		"""Displays mover as circle."""
		p.stroke(0)
		p.strokeWeight(2)
		p.fill(0,127)
		p.ellipse(self.location.x, self.location.y, self.mass*16, self.mass*16)	

	def checkEdges(self):
		"""Reverses velocity if past edge of window."""
		
		if self.location.x > width:
			self.location.x = width
			self.velocity.x *= -1
		elif self.location.x < 0:
			self.location.x = 0
			self.velocity.x *= -1
			
		if self.location.y > height:
			self.location.y = height
			self.velocity.y *= -1

p.run()
