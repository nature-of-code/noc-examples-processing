# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import uniform

def setup():
	p.size(600,600)
	p.smooth()
	global movers
	movers = [Mover() for i in range(0,20)]
	
def draw():
	p.background(255)
	for mover in movers:
		mover.update()
		mover.checkEdges()
		mover.display()
	
class Mover:
	
	topspeed = 5
	
	def __init__(self):
		self.location = p.PVector(uniform(0,width), uniform(0,height))
		self.velocity = p.PVector(0, 0)

	def update(self):
		mouse = p.PVector(p.mouse.x,p.mouse.y)
		acceleration = p.PVector.sub(mouse,self.location)
		acceleration.normalize()
		acceleration.mult(0.2)

		self.velocity.add(acceleration)
		# pyprocessing PVector has no 'limit' method
		if self.velocity.x > self.topspeed: self.velocity.x = self.topspeed
		if self.velocity.y > self.topspeed: self.velocity.y = self.topspeed
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
