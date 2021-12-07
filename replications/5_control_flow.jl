
#=

LECTURE 5

Control flow, user defined functions. 

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-09-01

=#

# If-then-else in Julia (wrapped in functions)

function if_else_1()

    x = 2
    y = 2.0
    z = [1 2.1 3.0 0.0]

    if y == 2 && z[end] ≥ 0.0
        println("Condition 1")
    elseif y < 2
        println("Condition 2")
    else 
        println("Condition 3")
    end
end

function if_else_2()

    x = true
    y = false

    if x && y
        println("Condition 1")
    elseif x && !(y)
        println("Condition 2")
    elseif !(x) && y
        println("Condition 3")
    elseif !(x) && !(y)
        println("Condition 4")
    else
        println("Condition 5")
    end
end

# Ternary operator

a, b, condition = 1, 3, true
c = condition ? a : b

# Flow Control

for i in [0, 1, 2, 3, 4, 5]
    println("A iteration $i")
end

for j in 1:5
    println("B iteration $j")
end

# Array comprehensions

x = []
for k in 0:14
    if k % 3 == 0
        append!(x, k)
    end
end
x

x = [k for k in 0:14 if k % 3 == 0] # Much easier for in some cases. 

# Multiple indexes

for (i, j) in zip(0:3, ["a", "b", "c", "d"])
    println("i = $i and  j = $j")
end

p = [x ^ y for x in (2, 3, 5) for y in 0:4]

# For else (come back to this)
# k = 0
# for i in 0:99
    
#     if k > 15
#         break
#     else 
#         println("I went all the way up to $i")
#     end
    
#     if i % 5 == 0
#         k += 1
#     else
#         println("Loop complete with k = $k and i = $i")
#     end
# end

# Sieve of Erastothenes example to find prime numbers

upper = 23
primes = [i for i in 1:(upper+1)]
divisor = 1

while true

    divisor += 1

    if divisor > upper
        break
    end

    if divisor ∉ primes
        continue
    end

    i = 1

    while i < length(primes)
        if primes[i] != divisor & primes[i] % divisor == 0
            deleteat!(primes, primes[i]) # Have to think on this line. This is the crucial step. 
        else
            i += 1
        end
        println("Divisor: ", divisor, primes)
    end
end





