
#=

LECTURE 7

Object oriented programming (does not really translate all that well in Julia)

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-11-19

=#

# The idea of a struct is not exactly the same as an object. Use the type system instead. 

function fibonacci_procedural(n; fst = 1, sec = 1)

    #f = [0] * n # This is an array of n zeros
    f = zeros(n) # Array of n zeros
    f[1], f[2] = fst, sec
    for i in 3:n
        f[i]  = f[i - 1] + f[i - 2] 
    end
    return f
end

# Functional programming (not right at the moment, think this through)
function fibonacci_functional(n, first, second)
     
    if n == 0
        return [] # return empty list
    else
        return [first] + fibonacci_functional(n - 1, second, first + second)
    end
end

# Object oriented programming
struct fibonacci
    first::Int64
    second::Int64
    n::Int64
end


# This is an outer constructor, could also use inner constructor within the struct. 
function fib_series(x::fibonacci)
    f = zeros(x.n)
    f[1], f[2] = x.first, x.second
    
    for i in 3:x.n
        f[i] = f[i - 1] + f[i - 2]
    end
    return f
end

example = fibonacci(1, 1, 5) # Instance of the fibonnacy struct
fib_series(example)
fib_series(fibonacci(1, 1, 10))

s1 = "Economics "
s2 = "Econometrics"

# s1 + s2 # In Julia there is no method matching summation for strings. Different from Python.
s1 * s2 # String concatenation done via the * operator

x = [4, 5, "hello"] # Mutable array
y = (4, 5, "hello") # Immutable tuple
z = Dict("key" => "value", "another key" => 574)

# Some more examples of classes in Python

struct Firm 
    α::Float64
    A::Float64
end

function production(x::Firm, val)
    return x.A * val ^ x.α
end

firm_ex = Firm(0.5, 2.0)
production(firm_ex, 10)

# There is a discussion on this here -- https://docs.julialang.org/en/v1/manual/methods/#Function-like-objects
struct Polynomial
    coeffs
end

# Continue at a later stage. 
