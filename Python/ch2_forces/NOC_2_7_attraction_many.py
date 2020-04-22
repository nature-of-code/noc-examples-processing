# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import uniform

def setup():
	p.size(800,200)
	p.smooth()
	global movers, a
	movers = [Mover(uniform(0.1,2), uniform(0,width), uniform(0,height)) for i in range(0,10)]
	a = Attractor()

def draw():
	p.background(255)

	a.drag()
	a.hover(p.mouse.x, p.mouse.y)	
	a.display()

	for m in movers:
		force = a.attract(m)
		m.applyForce(force)
		m.update()		
		m.display()

def mousePressed():
	a.clicked(p.mouse.x, p.mouse.y)

def mouseReleased():
	a.stopDragging()


class Attractor:
	
	def __init__(self):
		self.location = p.PVector(width/2,height/2)
		self.mass = 20
		self.G = 1
		self.dragOffset = p.PVector(0.,0.,0.)
		self.dragging = False
		self.rollover = False
	
	def attract(self, m):
		force = p.PVector.sub(self.location, m.location)
		d = force.mag()
		d = p.constrain(d,5.,25.)
		force.normalize()
		strength = self.G*(self.mass*m.mass)/(d**2)
		force.mult(strength)

		return force
	
	def display(self):
		p.ellipseMode(p.CENTER)
		p.strokeWeight(4)
		p.stroke(0)
		if self.dragging: 
			p.fill(50)
		elif self.rollover: 
			p.fill(100)
		else: 
			p.fill(175,200)
		p.ellipse(self.location.x, self.location.y, self.mass*2, self.mass*2)

	def clicked(self,mx,my):
		d = p.dist(mx,my,self.location.x,self.location.y)
		if d < self.mass:
			self.dragging = True
			self.dragOffset.x = self.location.x-mx
			self.dragOffset.y = self.location.y-my
			
	def hover(self,mx,my):
		d = p.dist(mx,my,self.location.x,self.location.y)
		if d < self.mass:
			self.rollover = True
		else:
			self.rollover = False

	def stopDragging(self):
		self.dragging = False

	def drag(self):
		if self.dragging:
			self.location.x = p.mouse.x + self.dragOffset.x
			self.location.y = p.mouse.y + self.dragOffset.y
			
class Mover:
	
	def __init__(self, mass, x, y):
		"""Creates new mover instance."""
		self.location = p.PVector(x, y)
		self.velocity = p.PVector(1, 0)
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
		p.ellipse(self.location.x, self.location.y, self.mass*25, self.mass*25)	

	def checkEdges(self):
		"""Reverses velocity if past edge of window."""
		
		if self.location.x > width:
			self.location.x = 0
		elif self.location.x < 0:
			self.location.x = width
			
		if self.location.y > height:
			self.location.y = height
			self.velocity.y *= -1

p.run()

