#=

LECTURE 13

Bisection and Newton

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2022-06-06

Here we look at solving equations of one variable

=#

function bisection(f; a = -3, b = -0.5, tol = 1e-6, maxiter = 100, callback = nothing)

    # The assertion error works here as expected. 
    @assert f(a) * f(b) < 0 "Function has the same sign at the bounds"

    for i in 1:maxiter # Use the underscore when not using the value in the actual loop.
        
        err = abs(b - a)

        x = (a + b) / 2

        if err < tol 
            return x
        end

        if f(a) * f(x) > 0
            a, b = x, b
        else
            a, b = a, x
        end 

        # ** Don't know if this callback will work like this. ** 
        # if !(callback = nothing)
        #     err = err, x = x, iter = i 
        # else
        #     ErrorException("Failed to converge")
        # end

    end
end

# This code works (easy to read as well)
bisection(x -> -4x^3 + 5x + 1)
