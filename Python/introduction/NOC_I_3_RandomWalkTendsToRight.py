# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import random

def setup():		
	p.size(800,200)
	p.background(255)
	global w
	w = Walker()

def draw():
	w.step()
	w.render()

class Walker:
	
	def __init__(self):
		self.x = width/2
		self.y = height/2
	
	def render(self):
		p.stroke(0)
		p.point(self.x, self.y)
	
	def step(self):
		"""Randomly move up, down, left, right or stay in one place."""
		
		choice = random()
		if choice < 0.4:
			self.x += 1
		elif choice < 0.6:
			self.x -= 1
		elif choice < 0.8:
			self.y += 1
		else:
			self.y -= 1

		self.x = p.constrain(self.x, 0, width-1);
		self.y = p.constrain(self.y, 0, height-1);

p.run()
