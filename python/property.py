class Student(object):
    @property
    def score(self):
        return self._score

    @score.setter
    def score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an int')
        if value < 0 or value >100:
            raise ValueError('score must be in the range of 0~100')
        self._score = value

s = Student()
s.score = 60
print(s.score)
s.score = 100
print(s.score)
s.score = 1000
