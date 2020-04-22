# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import uniform
from itertools import combinations

G = 0.4

def setup():
	p.size(600,600)
	p.smooth()
	global movers
	movers = [Mover(uniform(0.1,2), uniform(0,width), uniform(0,height)) for i in range(0,10)]

def draw():
	p.background(255)
	
	# rather than a double-nested loop, taking advantage of itertools' combination
	# method to give all possible pairs with no repeats
	for (m1,m2) in combinations(movers,2):
		force = m1.attract(m2)
		m2.applyForce(force)
		# flip the force and apply it back (avoids duplicate calculations)
		force.mult(-1.)
		m1.applyForce(force)
		
	for m in movers:
		m.update()
		m.display()
			
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
		p.ellipse(self.location.x, self.location.y, self.mass*25, self.mass*25)	

	def attract(self, m):
		force = p.PVector.sub(self.location, m.location)
		d = force.mag()
		d = p.constrain(d,5.,25.)
		force.normalize()
		strength = G*(self.mass*m.mass)/(d**2)
		force.mult(strength)
		return force

p.run()

