
#=

LECTURE 7

Object oriented programming (does not really translate all that well in Julia)

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-11-19

=#

# The idea of a struct is not exactly the same as an object. Use the type system instead. 

struct fibonacci
    first::Int64
    second::Int64
    n::Int64
end

function fib_series(x::fibonacci)
    f = zeros(x.n)
    f[1], f[2] = x.first, x.second
    
    for i in 3:x.n
        f[i] = f[i - 1] + f[i - 2]
    end
    return f
end

example = fibonacci(1, 1, 5)
fib_series(example)
fib_series(fibonacci(1, 1, 10))