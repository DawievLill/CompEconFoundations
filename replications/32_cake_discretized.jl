
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

### Solution on the grid

using Parameters
using LinearAlgebra

@with_kw struct Params

    β = 0.9
    Wbar = 10
    ngrid = 50
    ε = eps()
    grid = LinRange(ε, Wbar, ngrid)

end

p = Params()

# Bellman operator (V0 is one dimensional vector of values on the grid)
function bellman(p::Params)
    @unpack grid, ε, ngrid, β, Wbar = p
    
    c = grid .- transpose(grid) # np.newaxis creates a column vector in this line

end