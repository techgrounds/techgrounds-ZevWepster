'''
The output should be:
True
'''
def rtn(x):
	return(x)

foo = rtn(3)

if foo < rtn(4): # we were looking for something smaller than 4
	print(True)
else:
	print(False)