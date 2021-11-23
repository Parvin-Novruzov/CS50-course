# step one - get height from user
print("Height")
mario = input()
# step two - check height to make sure it is valid
while mario.lstrip('-').isdigit() == False:
    print('input needs to be a number and can\'t contain charaters')
    print("Height")
    mario = input()
mario = int(mario)
while mario < 1 or mario > 8:
    print("input needs to be between 1 and 8")
    print("Height")
    mario = int(input())

# step 3 take valid number and print pattern 
# loop through mario
hashtag = "#"
blank = ' '
totalHashTags = ''
totalSpaces = ''

for x in range(1, mario + 1):
    totalHashTags = hashtag * x
    totalSpaces = blank * ((mario) - x)
    print(totalSpaces + totalHashTags)