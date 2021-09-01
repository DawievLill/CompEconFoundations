#=

LECTURE 30

Deterministic cake eating problem in finite time solved with value function iteration (method of successive approximation)

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-08-31

This code is an adapted version of the code written by Fedor Iskhakov at ANU. It translates most of the Python code used in the cake eating example in Lecture 30. 

=#
using LinearAlgebra
using Parameters

@with_kw struct params

    β :: Float64 = 0.9 # discount factor
    Wbar :: Int64 = 10 # upper bound of the cake size
    ngrid :: Int64 = 50 # number of grid points
    grid = collect(range(eps(), Wbar, length = ngrid)) 
    maxiter = 1000
    tol = 1e-4

end

p = params()

"""
    bellman(V0)

Bellman operator, with V0 as one-dimensional vector of values on the grid. 
"""
function bellman()
    @unpack β, Wbar, ngrid, grid = p

    c = grid .- reshape(grid, (1, ngrid)) # current state in columns and choices in rows
    c[c .== 0] .= eps() # want to avoid log(0)
    mask = c .> 0 # mask of infeasible choices (want c > 0)
    matV1 = fill(-Inf, (ngrid, ngrid)) # initialize V with -Inf

    V0 = log.(grid)
    
    matV0 = collect(repeat(V0, 1, ngrid)') # current value function repeated in columns

    matV1[mask] = log.(c[mask]) .+ β .* matV0[mask] # maximand of the Bellman equation
     
    V1 = maximum(matV1, dims = 2) # maximum in every row
    
    amax = argmax(matV1, dims = 2) # Get the argmax
    idx = getindex.(amax, 2) # Convert to index value
    c1 = grid .- grid[idx] # Consumption (gained from index of maximum in every column)
    
    return V1, c1
end

"""
    solve()

Solve the model with value function iteration (method of successive approximations)
"""
function solve()
    @unpack grid, maxiter, tol = p

    V0 = log.(grid) # assume that we consume everything with first iteration

    for iter in 1:maxiter
        V1, c1 = bellman(V0)

        if all(abs.(V1 .- V0) .< tol)
            break
        end

        V0 = V1
    end
    return V1, c1
end
# This last part not working for some reason, but the answer is the same as the notes. 

# The next part is to plot and compare to the true value and policy function. Can focus on this later. Should be easy enough to do. 