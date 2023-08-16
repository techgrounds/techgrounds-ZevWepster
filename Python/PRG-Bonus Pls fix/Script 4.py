'''
The output should be:
there are 0 kids on the street
there are 1 kids on the street
there are 2 kids on the street
there are 3 kids on the street
there are 4 kids on the street
'''
foo = 0
while foo <= 4: # <= means smaller or equal than so if the output needs to go to 4 we put 4 not 5
	print('there are', foo, 'kids on the street')
	foo += 1



foo = 0
while foo < 5: # other solution is to remove the equal sign
	print('there are', foo, 'kids on the street')
	foo += 1