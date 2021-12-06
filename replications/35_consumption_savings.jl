
#=

LECTURE 35: Part 1

Stochastic consumption-savings model with discretized choice. 

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-11-05

=#

# Moving from cake eating to consumption-savings (infinite horizon problem)
# This is the Deaton model

# In the cake eating problem, we had that the interest rate was one and income zero. 

# Stochastic consumption savings problem
# We focus on income fluctuations and fix the gross rate of interest
# We let the stochastic income follow a **log-normal distribution**, with parameters μ = 0 and σ something to be specified
# This means that stochastic income will be positive

# VFI will still work for these stochastic models. However, now we need to compute the expectation when calculating the maximand in the Bellman equation. For this we will be using quadrature (which is part of Lecture 34).

### Design of the Bellman equation in Lectures 30 and 32. 

# Maximand was represented as a matrix, with different states in columns and choices in rows. NBNB!
# Mask off the infeasible choices with -Inf 
# Take maximum along rows in each columns
# Resulting vector represents updated value function for every point in the state space -- this is the return of the Bellman operator. 

# Next we would add current utility and take the maximum. 
# However, in the stochastic case we need to compute the expectation via quadrature. 
# Build up the next period as a three dimensional array with choices in first dimension, states in the second dimension and quadrature weights in the third dimension. 
# Compute quadrature using dot product to get a matrix
# Add the current utility to complete the Bellman maximand as a matrix with states in columns, choices in rows. 

using Parameters

@with_kw struct Params 
    
    Mbar = 10 # Upper bound on wealth
    ngrid = 50 # Number of grid points in the state space
    nchgrid = 100 # Number of grid points in the decision space
    nquad = 10 # Number of quadrature points
    β = 0.9 # Discount factor
    R = 1.05 # Gross interest
    σ = 1.0 # Param in log-normal income distribution
    ε = eps() # Smallest positive float number difference
    grid = LinRange(ε, Mbar, ngrid) 
    chgrid = LinRange(ε, Mbar, nchgrid)

end

p = Params()

function quadrature_setup(p::Params)
    @unpack σ = p

    quadp, quadw = # Gauss-Legendre for [-1, 1]
    quadp = (quadp + 1) / 2
    quadp = # inverse cdf
    qaudw = quadw / 2
    ## NB -- quadrature points in third dimension of the a three dimensional array

end

function interp_function(p::Params)
    @unpack 

    if interpolation == "linear"
        return
    elseif interpolation == "quadratic"
        return
    elseif interpolation == "cubic"
        return
    elseif interpolation == "polynomial"
    
    end
end

