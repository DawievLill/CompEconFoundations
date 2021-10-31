#=

LECTURE 31

Function approximation

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-11-01

=#

# Approximate functions that are only defined on grid of points (arbitrary number of points)

# Spline interpolation

using Distributions
using Interpolations
using Plots
using Random

x = sort(rand(Uniform(-5, 10), 12)) # random number sequence
xr = LinRange(-5, 10, 12) # regular grid on [-5, 10]

func = x -> @. exp(-x / 4) * sin(x) + 1 / (1 + x ^ 2) # Function to interpolate

function plot_help(ifunc, fdata = func(x), f = func)

    xd = LinRange(-5, 10, 1000)

    scatter(fdata)
    plot!(xd, f(xd))

    #xdi = xd[xd .>= fdata[1][1] .&& xd .<= fdata[1][end]]

    #if ifunc
    #    plot!(xdi , ifunc(xdi))
    #end

end

plot_help(nothing)

fi = LinearInterpolation(x, func(x)) # returns interpolation function