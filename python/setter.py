class Student(object):
    #getter
    @property
    def birth(self):
        return self._num
   
    #setter
    @birth.setter
    def birth(self, value):
        self._num = value

    #getter
    @property
    def name(self):
        return 1000-self._num

s = Student()
s.birth = 110
print(s.birth)
print(s.name)
