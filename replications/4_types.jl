
#=

LECTURE 4

Types

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-11-26

=#

# Will not cover all the code here. Some of it is just a direct translation. 

x = false
y = true

x & y # Difference between && and & for Julia? 

y = 1 < 5
y = y & (4 < 8)

x = 1
print("x is $x")
print("Type of x is ", typeof(x))

y = 0b1111111111111111111111111111110
y = 0x1afe

print("y is $y")
print("Type of y is", typeof(y))
print("y takes", sizeof(y), "bytes in memory") # Clearly not the right command

a = 155
b = 7

c = a + b
d = a - 50 * b
e = a ^ b
f = a / b

typeof(e)
typeof(f)

g = a // b

typeof(g)

h = a % b

typeof(h)

# Boolean arithmetic

z = (1 < 5) - 5
x = 10
z = x * (x > 10) + x ^ 2 * (x < 10)

y = 5 - 4 > true
y = 6 < 10 ≤ 15
y = 5 / 2 ^ 4 < 10 | 15

# Floating point numbers

x = 183.0
print("Type of x is ", typeof(x))

# Assignment operator

a = 21
b = 10
c = 2

b ^= c 
c *= a
c -= a

objectid(a) # This is similar to the id() function in Python.
# Should also look at pointer and hash functions here. 

# Composite variable types

# We get several composite types, such as lists, tuples, dictionaries, sets and ranges. In Julia we speak of arrays rather than lists. 

x = [true, 5, 5.2, "string"] # vector / array
y = (true, 5, 5.2, "string") # tuples

typeof(x)
typeof(y)

x[1] = 567
y[1] = 567 # Produces an error... Why is this the case?

x = [true, 5, 5.2, "string", 4, 4+2im, "again"]
x[1]
x[2:end]
length(x)

# Difference between push and append?
push!(x, 586)
#append!(x, 586)

# Push seems to be for individual elements that are added, whereas append is for collection of elements. 

deleteat!(x, 4) # Removes the fourth element