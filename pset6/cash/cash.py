from cs50 import get_float
# Get float from user
while True:
    money = get_float("Change owed: ")
    if money > 0:
        break
# declare variables
total, count = money * 100, 0
# calculate count of coins
for x in [25, 10, 5, 1]:
    while total >= x:
        total -= x
        count += 1
# print result
print(f"{count}")