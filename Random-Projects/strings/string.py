f = open("strings.txt", "w")
f.write("Hello\n")
f.write("World\n")
f.write("from\n")
f.write("text\n")
f.write("file\n")
f.close()

f = open("strings.txt", "a")

f.close()

f = open("strings.txt", "r")

for x in f:
  print(x, x[::-1])
  
f.close()