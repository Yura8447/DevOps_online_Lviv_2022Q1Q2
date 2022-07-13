filename = input("Enter the file name: ")

file = open(filename)

count = 1
for line in file:
    if count % 2 == 0:
        print(line, end="")
    count += 1

file.close()
