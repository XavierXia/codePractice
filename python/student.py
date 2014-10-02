class Student():
	def __init__(self,name,score):
		self.name = name
		self.score = score
	def print_score(self):
		print '%s : %s' % (self.name, self.score)

balt = Student('balt',40)
valu = Student('valu',80)
balt.print_score()
valu.print_score()

