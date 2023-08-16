'''
The output should be:
4
16129
'''
def square(x):
	return x**2

nr = square(2)
print(nr)
foo = 127 # move this up so square(foo) actually has something to call
big = square(foo)
print(big)

