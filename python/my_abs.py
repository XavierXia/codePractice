def my_abs(x):
    if not isinstance(x,(int,float)):
        print "%s is wrong type" % type(x)
    if x > 0:
        return x
    if x < 0:
        return -x

my_abs('aaa')
print my_abs(-11) 
