# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

from pyprocessing import *
from random import randint

def setup():		
	size(800,200)
	background(255)
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
		stroke(0)
		point(self.x, self.y)
	
	def step(self):
		"""Randomly move up, down, left, right or stay in one place."""
		
		choice = randint(0,3)
		
		if choice is 0:
			self.x += 1
		elif choice is 1:
			self.x -= 1
		elif choice is 2:
			self.y += 1
		elif choice is 3: 
			self.y -= 1

		self.x = constrain(self.x, 0, width-1);
		self.y = constrain(self.y, 0, height-1);

run()
