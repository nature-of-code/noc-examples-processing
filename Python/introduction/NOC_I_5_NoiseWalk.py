# The Nature of Code
# Daniel Shiffman
# http://natureofcode.com
# ported to pyprocessing by Greg Meess

import pyprocessing as p
from random import uniform
from numpy import array

def setup():
	p.size(800,200)
	p.smooth()
	p.frameRate(30)

	global w
	w = Walker()

def draw():
	p.background(255)
	w.walk()
	w.display()

class Walker:
	
	def __init__(self):
		self.location = array([width/2, height/2])
		self.noff = array([uniform(0,1000), uniform(0,1000)]) 
	
	def display(self):
		p.strokeWeight(2)
		p.fill(127)
		p.stroke(0)
		p.ellipse(self.location[0], self.location[1], 48, 48)
	
	def walk(self):
		"""Randomly move up, down, left, right or stay in one place."""
		# NOTE: pyprocessing perlin noise functionality appears to be glitchy
		# (it freezes at exactly 0 for a series of steps)
		self.location[0] = p.map(p.noise(self.noff[0]), -1, 1, 0, width)
		self.location[1] = p.map(p.noise(self.noff[1]), -1, 1, 0, height)
		self.noff += 0.01

p.run()
