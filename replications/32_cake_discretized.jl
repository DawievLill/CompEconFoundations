
#=

LECTURE 32

Cake eating model with discretized choice

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-11-05

=#

# We will use function approximation to solve the cake eating problem with discretized choice

# For the value function iteration algorithm we start with an arbitrary guess for the value function and then iterate. At each iteration we apply Bellman operator and repeat until convergence. 

# Problem is that cake is continuous, so the value function is a function of a continuous variable. 

# We want to discretize the cake size so that we have a grid of cake sizes. 

# May need to compute the value function between grid points, this means that we will need to use interpolation and function approximation. 

# Preamble
using Interpolations
using LinearAlgebra
using Parameters


@with_kw struct Params

    β = 0.9
    Wbar = 10 # upper bound of the cake-size grid 
    ngrid = 50
    nchgrid = 100 # number of grid points for choice grid
    ε = eps()
    grid = LinRange(ε, Wbar, ngrid)
    chgrid = LinRange(ε, Wbar, nchgrid)
    maxiter = 1000
    tol = 1e-4

end

p = Params()

### Cake eating with discretized choice

# Grid over state space separately from discretization of the choice variables. 
# Discretise both the state space and decision space. 

function bellman(p::Params)
    @unpack grid, chgrid, ε, ngrid, β, Wbar = p
    
    c = transpose(chgrid) # This is now a column vector

    c = grid .- transpose(grid) # np.newaxis creates a column vector in this line
    # c = grid .- reshape(grid, (1, ngrid)) # alternative way to do the same thing as above

    c[c .== 0] .= ε
    mask = c .> 0
    matV1 = fill(-Inf, (ngrid, ngrid))
    V0 = log.(grid)
    matV0 = collect(repeat(V0, 1, ngrid)')
    matV1[mask] = log.(c[mask]) .+ β .* matV0[mask]
    V1 = maximum(matV1, dims = 2)
    amax = argmax(matV1, dims = 2)
    idx = getindex.(amax, 2)
    c1 = grid .- grid[idx]

    return V1, c1

end

function solve(p::Params)
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

# This function compares the analytic and numerical solution via plots. 
function check_analytic(p::Params)
    @unpack grid, ε, ngrid, β, Wbar, grid, maxiter, tol = p

    # analytic solution
    aV = w -> log(w) / (1 - β) + log(1 - β) / (1 - β) + β * log(β) / ((1 - β)^2) 
    aP = w -> (1 - β) * w
    
    xg = LinRange(ε, Wbar, 1000) # dense grid for analytical solution

    V, policy = solve(p)

    # See the plots documentation for generating subplots. 
    plot(grid, V)
    plot(xg, aV(xg))
    plot(grid, policy)
    plot(grid, aP(grid))

end


