# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import randint

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
	
	topspeed = 10
	
	def __init__(self):
		self.location = p.PVector(width/2, height/2)
		self.velocity = p.PVector(0, 0)
		self.acceleration = p.PVector(-0.001, 0.01)

	def update(self):
		self.velocity.add(self.acceleration)
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
