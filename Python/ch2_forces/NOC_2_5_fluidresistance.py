# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import uniform

def setup():
	p.size(800,200)
	p.smooth()
	global movers, liquid
	reset()
	liquid = Liquid(0, height/2, width, height/2, 0.1)

def draw():
	p.background(255)
	liquid.display()
	
	for mover in movers:
		
		if liquid.contains(mover):
			dragForce = liquid.drag(mover)
			mover.applyForce(dragForce)
		
		gravity =  p.PVector(0,0.1*mover.mass)
		mover.applyForce(gravity)

		mover.update()
		mover.checkEdges()
		mover.display()
	p.fill(0)
	p.text("click mouse to reset", 10, 30)

def mousePressed():
	reset()

def reset():
	global movers
	movers = [Mover(uniform(1,4), uniform(0,width), 0) for i in range(0,5)]
	

class Liquid:
	
	def __init__(self, x, y, w, h, c):
		self.x = x
		self.y = y
		self.w = w
		self.h = h
		self.c = c

	def contains(self, m):
		if m.location.x > self.x and \
		   m.location.x < self.x + self.w and \
		   m.location.y > self.y and \
		   m.location.y < self.y + self.h:
			return True
		else:
			return False
			
	def drag(self, m):
		speed = m.velocity.mag()
		dragMagnitude = self.c*speed**2 
		
		dragForce = m.velocity.get()
		dragForce.mult(-1)
		dragForce.normalize()
		dragForce.mult(dragMagnitude)
		return dragForce
	
	def display(self):
		p.noStroke()
		p.fill(50)
		p.rect(self.x,self.y,self.w,self.h)
	
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

